@echo off
setlocal EnableDelayedExpansion

rem ===== 配置区域 =====
set "JAVA_VERSION=21"
set "ARCH=x64"
set "SCRIPT_DIR=%~dp0"
set "JDK_DIR=%SCRIPT_DIR%java"
set "ZIP_FILE=%SCRIPT_DIR%jdk-download.zip"

rem ===== 选择 JDK 发行版=====
echo.
echo 请选择要下载的 JDK 21 发行版：
echo.
echo   1. Microsoft OpenJDK   （微软 JDK）[推荐]
echo   2. Eclipse Temurin     （社区最广泛使用）
echo   3. Azul Zulu           （安全性与稳定性优先）
echo.
set /p "CHOICE=选择 JDK (默认 Microsoft): "
if "%CHOICE%"=="" set "CHOICE=1"

set "DISTRO="
if "%CHOICE%"=="1" set "DISTRO=microsoft"
if "%CHOICE%"=="2" set "DISTRO=temurin"
if "%CHOICE%"=="3" set "DISTRO=zulu"

if "%DISTRO%"=="" (
    echo 无效选择。
    pause
    exit /b 1
)

echo.
echo 正在解析 %DISTRO% JDK %JAVA_VERSION% (%ARCH%) 下载链接...

if /i "%DISTRO%"=="microsoft" goto :resolve_microsoft
if /i "%DISTRO%"=="temurin"   goto :resolve_temurin
if /i "%DISTRO%"=="zulu"      goto :resolve_zulu


:resolve_microsoft
set "REAL_URL=https://aka.ms/download-jdk/microsoft-jdk-%JAVA_VERSION%-windows-%ARCH%.zip"
goto :download


:resolve_temurin
set "API_URL=https://api.adoptium.net/v3/binary/latest/%JAVA_VERSION%/ga/windows/%ARCH%/jdk/hotspot/normal/eclipse"
for /f "usebackq delims=" %%U in (`powershell -NoProfile -Command "$r=Invoke-WebRequest -Uri '%API_URL%' -MaximumRedirection 0 -ErrorAction SilentlyContinue; if($r.Headers.Location){$r.Headers.Location}"`) do set "REAL_URL=%%U"
if not defined REAL_URL set "REAL_URL=%API_URL%"
goto :download


:resolve_zulu
set "ZULU_API=https://api.azul.com/metadata/v1/zulu/packages?os=windows&arch=x64&archive_type=zip&java_package_type=jdk&javafx_bundled=false&release_status=ga&availability_types=ca&certifications=tck&latest=true&java_version=%JAVA_VERSION%"
powershell -NoProfile -Command ^
  "$j=Invoke-RestMethod -Uri '%ZULU_API%';" ^
  "if($j.Count -gt 0){$j[0].download_url} else {throw 'Zulu package not found'}" > "%TEMP%\zulu_url.txt" 2>&1
set /p REAL_URL=<"%TEMP%\zulu_url.txt"
del "%TEMP%\zulu_url.txt" 2>nul
if not defined REAL_URL (
    echo 错误：无法获取 Zulu 下载链接。
    pause
    exit /b 1
)
goto :download


:download
echo.
echo 下载地址: %REAL_URL%
echo.

rem ===== 流式下载 + 进度条 =====
powershell -NoProfile -Command "$ErrorActionPreference='Stop'; $url='%REAL_URL%'; $out='%ZIP_FILE%'; $total=-1; try{$req=[System.Net.HttpWebRequest]::Create($url);$req.Method='HEAD';$req.AllowAutoRedirect=$true;$req.Timeout=30000;$resp=$req.GetResponse();$total=$resp.ContentLength;$resp.Close()}catch{}; if($total -gt 0){[Console]::WriteLine(('文件总大小: {0} MB' -f [math]::Round($total/1MB,2)))}else{[Console]::WriteLine('文件总大小: 未知')}; $wc=New-Object System.Net.WebClient; $stream=$wc.OpenRead($url); if($total -le 0 -and $wc.ResponseHeaders['Content-Length']){$total=[long]$wc.ResponseHeaders['Content-Length']; [Console]::WriteLine(('文件总大小: {0} MB' -f [math]::Round($total/1MB,2)))}; $file=[System.IO.File]::Create($out); $buffer=New-Object byte[] 65536; $received=0; $barLen=40; $lastPct=-1; try{ while(($read=$stream.Read($buffer,0,$buffer.Length)) -gt 0){ $file.Write($buffer,0,$read); $received+=$read; if($total -gt 0){ $pct=[int]($received*100/$total); if($pct -ne $lastPct){ $lastPct=$pct; $filled=[int]($pct*$barLen/100); $bar=('#'*$filled)+('-'*($barLen-$filled)); $mb=[math]::Round($received/1MB,2); $totalMb=[math]::Round($total/1MB,2); $line=('[{0}] {1,3}%%  {2,8:0.00} / {3,8:0.00} MB' -f $bar,$pct,$mb,$totalMb); [Console]::Write([char]13 + $line + '   '); [Console]::Out.Flush() } } else { $mb=[math]::Round($received/1MB,2); [Console]::Write([char]13 + ('已下载: {0:0.00} MB   ' -f $mb)); [Console]::Out.Flush() } } } finally { $file.Close(); $stream.Close() }; [Console]::WriteLine(''); [Console]::WriteLine('下载完成。')"

if not exist "%ZIP_FILE%" (
    echo 错误：下载失败。
    pause
    exit /b 1
)

rem ===== 解压 =====
echo.
echo 正在解压到：%JDK_DIR%
if exist "%JDK_DIR%" rmdir /s /q "%JDK_DIR%"
mkdir "%JDK_DIR%"

powershell -NoProfile -Command "Expand-Archive -Path '%ZIP_FILE%' -DestinationPath '%JDK_DIR%' -Force"
if errorlevel 1 (
    echo 错误：解压失败。
    pause
    exit /b 1
)

rem ===== 整理目录（去掉顶层子目录） =====
powershell -NoProfile -Command "$root='%JDK_DIR%'; $java=Get-ChildItem -Path $root -Recurse -Filter 'java.exe' -File -ErrorAction SilentlyContinue | Where-Object { $_.DirectoryName -like '*\bin' } | Select-Object -First 1; if($java){ $jdkHome=Split-Path (Split-Path $java.FullName -Parent) -Parent; if($jdkHome.TrimEnd('\') -ne $root.TrimEnd('\')){ Get-ChildItem -Path $jdkHome -Force | ForEach-Object { Move-Item -LiteralPath $_.FullName -Destination $root -Force }; Remove-Item -LiteralPath $jdkHome -Recurse -Force -ErrorAction SilentlyContinue } }"

del "%ZIP_FILE%" 2>nul

rem ===== 验证 =====
echo.
echo JDK 已安装至：%JDK_DIR%
if exist "%JDK_DIR%\bin\java.exe" (
    "%JDK_DIR%\bin\java.exe" -version
) else (
    echo 警告：未找到 java.exe，请检查解压结构。
)
pause
endlocal