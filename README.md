# 我的 RIME 配置

## 前置要求

- [nushell](https://www.nushell.sh/)
- [just](https://just.systems/)

## 安装与构建

```bash
git clone https://github.com/Passthem-desu/pt-dotfile-rime.git
cd pt-dotfile-rime
git submodule update --init
just build
```

然后，配置 RIME 的配置文件链接到产生的 ./dist 目录。在 Windows 使用 Weasel 的话，就配置用户文件夹到这个目录。
