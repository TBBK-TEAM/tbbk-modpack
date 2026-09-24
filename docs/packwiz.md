## packwiz

一个用于创建 Minecraft 整合包的命令行工具

### 选项

| 选项 | 说明 |
|------|------|
| `--cache string` | packwiz 缓存已下载 mod 的目录 (default "C:\\Users\\Administrator\\AppData\\Local\\packwiz\\cache") |
| `--config string` | 要使用的配置文件 (default "C:\Users\Administrator\AppData\Roaming\packwiz\.packwiz.toml") |
| `-h, --help` | packwiz 的帮助信息 |
| `--meta-folder string` | 新元数据文件将添加到的文件夹，默认为基于类别的文件夹（mods、resourcepacks 等；如果类别未知则使用当前目录） |
| `--meta-folder-base string` | meta-folder 将相对于其解析的基础文件夹，默认为当前目录（这样你可以将所有 mod 等放在子文件夹中，同时仍使用默认行为） (default ".") |
| `--pack-file string` | 要使用的整合包元数据文件 (default "pack.toml") |
| `-y, --yes` | 以默认或"yes"选项接受所有提示（非交互模式）- 可能会在搜索结果中选择不需要的选项 |

### 另请参阅

* [packwiz completion](packwiz_completion.md)	 - 为指定的 shell 生成自动补全脚本
* [packwiz curseforge](packwiz_curseforge.md)	 - 管理基于 CurseForge 的 mod
* [packwiz github](packwiz_github.md)	 - 管理在 GitHub 上发布的项目
* [packwiz init](packwiz_init.md)	 - 初始化一个 packwiz 整合包
* [packwiz list](packwiz_list.md)	 - 列出整合包中的所有 mod
* [packwiz migrate](packwiz_migrate.md)	 - 将你的 Minecraft 和加载器版本迁移到更新的版本。
* [packwiz modrinth](packwiz_modrinth.md)	 - 管理基于 Modrinth 的 mod
* [packwiz pin](packwiz_pin.md)	 - 锁定文件，使其不会自动更新
* [packwiz refresh](packwiz_refresh.md)	 - 刷新索引文件
* [packwiz rehash](packwiz_rehash.md)	 - 将所有哈希值迁移到指定格式
* [packwiz remove](packwiz_remove.md)	 - 从整合包中移除外部文件；等同于手动删除文件并运行 packwiz refresh
* [packwiz serve](packwiz_serve.md)	 - 运行本地开发服务器
* [packwiz settings](packwiz_settings.md)	 - 管理整合包设置
* [packwiz unpin](packwiz_unpin.md)	 - 解除文件锁定，使其可以接收更新
* [packwiz update](packwiz_update.md)	 - 更新整合包中的一个外部文件（或所有外部文件）
* [packwiz url](packwiz_url.md)	 - 通过直接下载链接添加外部文件，适用于 packwiz 未直接支持的站点
* [packwiz utils](packwiz_utils.md)	 - 管理 packwiz 自身的实用工具
