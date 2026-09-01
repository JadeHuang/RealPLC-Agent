# RealPLC Agent 版本发布流程

本流程用于保证安装包可追溯、可校验、可回滚，并避免后续升级覆盖历史版本。

## 1. 版本规则

- 使用 Semantic Versioning：`MAJOR.MINOR.PATCH`。
- 测试版本使用 `vX.Y.Z-beta.N` 或 `vX.Y.Z-rc.N`。
- 稳定版本使用 `vX.Y.Z`。
- 标签、Release 和安装包版本必须一致。
- 已发布的标签和安装包不可覆盖、复用或静默替换；任何二进制变化都必须发布新版本。

安装包命名：

```text
RealPLC_Agent_vX.Y.Z_Setup.exe
RealPLC_Agent_vX.Y.Z_Setup.exe.sha256
```

## 2. 发布前冻结

1. 更新产品版本、README、兼容性说明和 CHANGELOG。
2. 完成自动测试、CODESYS 原生编译和目标版本真机验证。
3. 在干净的 Windows 10/11 x64 环境完成安装、升级、卸载和依赖安装测试。
4. 提交全部发布改动，确认工作区干净。
5. 从该提交创建不可复用的版本标签，并仅从该标签构建。

## 3. 代码签名

公开稳定版本必须使用受信任的代码签名证书或可信云签名服务：

1. 签署所有 RealPLC 第一方 EXE 和 DLL。
2. 不重新签署 Microsoft、Node.js、Siemens、CODESYS 或其他第三方文件。
3. 使用 SHA-256 文件摘要和 RFC 3161 时间戳。
4. 由 Inno Setup 签署安装程序和卸载程序。
5. 使用 `signtool verify /pa /v` 或 `Get-AuthenticodeSignature` 验证签名。

自签名证书不视为公开发行的可信签名。没有可信证书时，只能发布明确标记的 Pre-release，并必须在 README 和 Release Notes 中说明未签名状态。

## 4. 生成校验信息

```powershell
$installer = '.\RealPLC_Agent_vX.Y.Z_Setup.exe'
$hash = Get-FileHash -LiteralPath $installer -Algorithm SHA256
"$($hash.Hash)  $([IO.Path]::GetFileName($installer))" |
  Set-Content -LiteralPath "$installer.sha256" -Encoding ascii
```

重新计算的 SHA-256 必须同时出现在：

- Release Notes；
- `.sha256` Release 资产；
- README 当前下载区；
- GitHub Release API 的资产 digest（上传后核对）。

## 5. 发布 Release

Release 必须包含：

- 版本和发布状态；
- 支持的 Windows、CODESYS 版本与架构；
- 管理员权限和依赖要求；
- 新增、修复和已知限制；
- 安全边界和未签名/签名发布者状态；
- 安装包大小和 SHA-256；
- 安装包及 `.sha256` 文件；
- Issue、许可、隐私和安全入口。

预发布版本勾选 **Pre-release**。只有经过可信签名、干净机验收和目标工程软件真机验证的构建才能标记为稳定版本。

## 6. 发布后验证

1. 从公开 Release 页面重新下载安装包。
2. 对下载文件重新计算 SHA-256，并与本地构建和 GitHub digest 对比。
3. 验证直接下载链接、README、Issue 模板和文档链接。
4. 确认版本标签指向用于构建的冻结提交。
5. 记录 Release URL、标签、提交 SHA、文件大小和哈希。
6. 保留旧 Release 以支持审计与回滚。

## 7. 后续升级

- 缺陷修复发布新的 Patch，例如 `v0.4.1`。
- 向后兼容功能发布新的 Minor，例如 `v0.5.0`。
- 不兼容变化发布新的 Major。
- 升级前验证旧版本数据保留、计划任务迁移、安装目录和卸载行为。
- README 的“当前版本”链接随新版本更新，但 CHANGELOG 和旧 Release 永久保留。
