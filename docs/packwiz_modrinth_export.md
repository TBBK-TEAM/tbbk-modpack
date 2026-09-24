## packwiz modrinth export

将当前整合包导出为 Modrinth 使用的 .mrpack 文件

```
packwiz modrinth export [flags]
```

### 选项

| 选项 | 说明 |
|------|------|
| `-h, --help` | export 的帮助信息 |
| `-o, --output string` | 整合包导出到的文件 |
| `--restrictDomains` | 将域名限制为 modrinth.com 允许的域名 (default true) |

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

* [packwiz modrinth](packwiz_modrinth.md)	 - 管理基于 Modrinth 的 mod
