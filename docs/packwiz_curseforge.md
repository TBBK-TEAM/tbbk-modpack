## packwiz curseforge

管理基于 CurseForge 的 mod

### 选项

| 选项 | 说明 |
|------|------|
| `-h, --help` | curseforge 的帮助信息 |

### 从父命令继承的选项

| 选项 | 说明 |
|------|------|
| `--cache string` | packwiz 缓存已下载 mod 的目录 (default "C:\\Users\\Administrator\\AppData\\Local\\packwiz\\cache") |
| `--config string` | 要使用的配置文件 (default "C:\Users\Administrator\AppData\Roaming\packwiz\.packwiz.toml") |
| `--meta-folder string` | 新元数据文件将添加到的文件夹，默认为基于类别的文件夹（mods、resourcepacks 等；如果类别未知则使用当前目录） |
| `--meta-folder-base string` | meta-folder 将相对于其解析的基础文件夹，默认为当前目录（这样你可以将所有 mod 等放在子文件夹中，同时仍使用默认行为） (default ".") |
| `--pack-file string` | 要使用的整合包元数据文件 (default "pack.toml") |
| `-y, --yes` | 以默认或"yes"选项接受所有提示（非交互模式）- 可能会在搜索结果中选择不需要的选项 |

### 另请参阅

* [packwiz](packwiz.md)	 - 一个用于创建 Minecraft 整合包的命令行工具
* [packwiz curseforge add](packwiz_curseforge_add.md)	 - 通过 CurseForge URL、slug、ID 或搜索添加项目
* [packwiz curseforge detect](packwiz_curseforge_detect.md)	 - 检测 mods 文件夹中的 .jar 文件（实验性）
* [packwiz curseforge export](packwiz_curseforge_export.md)	 - 将当前整合包导出为 CurseForge 使用的 .zip 文件
* [packwiz curseforge import](packwiz_curseforge_import.md)	 - 从已下载的整合包 zip 或已安装的元数据 json 文件导入 CurseForge 整合包
* [packwiz curseforge open](packwiz_curseforge_open.md)	 - 在浏览器中打开某个 CurseForge 文件的项目页面
