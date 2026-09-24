## packwiz serve

运行本地开发服务器

### 概要

运行本地 HTTP 服务器用于开发，在查询时自动刷新索引

```
packwiz serve [flags]
```

### 选项

| 选项 | 说明 |
|------|------|
| `--basic` | 禁用刷新并允许访问目录中的所有文件，而不仅仅是索引中列出的文件 |
| `-h, --help` | serve 的帮助信息 |
| `-p, --port int` | 服务器运行的端口 (default 8080) |
| `-r, --refresh` | 自动刷新索引文件 (default true) |

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
