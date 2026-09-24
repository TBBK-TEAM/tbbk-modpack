## packwiz url add

通过直接下载链接添加外部文件，适用于 packwiz 未直接支持的站点

```
packwiz url add [name] [url] [flags]
```

### 选项

| 选项 | 说明 |
|------|------|
| `--force` | 即使下载 URL 已被 packwiz 的替代命令支持（可能支持依赖和更新），也强制添加文件 |
| `-h, --help` | add 的帮助信息 |
| `--meta-name string` | 为创建的元数据文件使用的文件名（默认为你提供的名称生成的名称） |

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

* [packwiz url](packwiz_url.md)	 - 通过直接下载链接添加外部文件，适用于 packwiz 未直接支持的站点
