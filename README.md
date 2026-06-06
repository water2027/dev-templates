# 个人自用的模板

使用普通的 `nix develop` 启动开发环境。

eg:

```sh
nix flake init -t github:water2027/dev-templates#rust # 拉取模板

nix develop # 按需修改后启动环境
```

前端开发环境：

```sh
nix flake init -t github:water2027/dev-templates#frontend
nix develop
pnpm dev --host 0.0.0.0
```

C++ 开发环境：

```sh
nix flake init -t github:water2027/dev-templates#cpp
nix develop
```
