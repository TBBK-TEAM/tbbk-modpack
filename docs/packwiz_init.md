## packwiz init

初始化一个 packwiz 整合包

```
packwiz init [flags]
```

### 选项

| 选项 | 说明 |
|------|------|
| `--author string` | 整合包的作者（省略则以交互方式定义） |
| `--fabric-latest` | 自动选择最新版本的 Fabric 加载器 |
| `--fabric-version string` | 要使用的 Fabric 加载器版本（省略则以交互方式定义） |
| `--forge-latest` | 自动选择最新版本的 Forge |
| `--forge-version string` | 要使用的 Forge 版本（省略则以交互方式定义） |
| `-h, --help` | init 的帮助信息 |
| `--index-file string` | 要使用的索引文件 (default "index.toml") |
| `-l, --latest` | 自动选择最新版本的 Minecraft |
| `--liteloader-latest` | 自动选择最新版本的 LiteLoader |
| `--liteloader-version string` | 要使用的 LiteLoader 版本（省略则以交互方式定义） |
| `--mc-version string` | 要使用的 Minecraft 版本（省略则以交互方式定义） |
| `--modloader string` | 要使用的 mod 加载器（省略则以交互方式定义） |
| `--name string` | 整合包的名称（省略则以交互方式定义） |
| `--neoforge-latest` | 自动选择最新版本的 NeoForge |
| `--neoforge-version string` | 要使用的 NeoForge 版本（省略则以交互方式定义） |
| `--quilt-latest` | 自动选择最新版本的 Quilt 加载器 |
| `--quilt-version string` | 要使用的 Quilt 加载器版本（省略则以交互方式定义） |
| `-r, --reinit` | 如果 pack 文件已存在则重新创建它，而不是退出 |
| `-s, --snapshot` | 配合 --latest 使用最新的快照版本 |
| `--version string` | 整合包的版本（省略则以交互方式定义） |

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
