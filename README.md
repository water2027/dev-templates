# 个人自用的模板

需要[devenv](https://devenv.sh/getting-started/)

eg:

```sh
nix flake init -t github:water2027/dev-templates#rust # 拉取模板

nix shell zsh # 按需修改后启动环境
```

前端开发环境：

```sh
nix flake init -t github:water2027/dev-templates#frontend
```

C++ 开发环境：

```sh
nix flake init -t github:water2027/dev-templates#cpp
```
