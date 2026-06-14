# 个人自用的模板

使用普通的 `nix develop` 启动开发环境。

eg:

```sh
nix flake init -t github:water2027/dev-templates#rust # 拉取模板

nix develop # 按需修改后启动环境
```

JavaScript / 前端开发环境：

```sh
nix flake init -t github:water2027/dev-templates#javascript
nix develop
```

默认只启用 Node.js、pnpm、corepack、bun、ESLint 和基础 Web LSP。需要浏览器或前端工具时，修改生成后的 `flake.nix` 里的 `features`：

```nix
features = {
  browser = true;      # Linux 上加入 chromium
  playwright = true;   # 加入 Playwright browsers，并跳过 npm 下载浏览器
  typescript = true;   # 加入 TypeScript language servers
  vue = true;          # 加入 Vue language server
  nativeBuild = true;  # 加入 git/jq/openssl/pkg-config/vips
};
```

然后启动项目命令：

```sh
pnpm dev --host 0.0.0.0
```

C++ 开发环境：

```sh
nix flake init -t github:water2027/dev-templates#cpp
nix develop
```
