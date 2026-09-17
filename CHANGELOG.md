# 更新日志

本项目遵循 [Semantic Versioning](https://semver.org/) 进行版本管理。预发布版本使用 `-alpha`、`-beta.N` 或 `-rc.N` 后缀；已发布的版本文件和标签不覆盖、不复用。

## [0.4.5] - 2026-09-17

> 正式 Release（公开测试），统一默认 RealPLC 云端地址并发布 Windows x64 安装包。

### 变更

- 默认 RealPLC 云端 WebSocket 地址统一为 `wss://www.realplc.com/api/agent-gateway/agent/ws`。
- 产品、程序集、TIA Connector manifest 和安装器元数据统一为 `0.4.5`。
- 已有用户配置不被覆盖；新安装或重新生成默认配置时使用新地址。
- 发布页同步提供安装包 SHA-256 校验文件。

### 验证

- 完整 Release Rebuild 通过。
- 六个 RealPLC EXE 的文件版本均为 `0.4.5.0`。
- 发布安装包：`RealPLC_Agent_V0.4.5_Setup_x64.exe`。
- 安装包 SHA-256：`E0C69AB751575671FF636BC6F0C68731DC9328501FF8DB4D8CB30148208D5EFB`。
- 安装包当前尚未使用可信代码签名证书签名。

### 已知限制

- 当前构建机未安装 TIA Portal，TIA Openness 的最终连接仍需在目标 Windows 环境验收。

## [0.4.4] - 2026-09-15

> 正式 Release（公开测试），用于验证 v0.4.3 → v0.4.4 自动升级。

### 修复

- TIA 状态改用最近一次真实 Openness 成功操作作为连接证据，避免已能读取快照却显示“未运行”。
- 多 TIA 实例同时打开项目时要求明确选择 `ProcessId`，避免静默连接到错误工程。
- TIA 环境向导收敛为六步，移除源码构建、Mock Gateway、云端、MCP 和本地 HTTP 等无关阻断项。
- CODESYS 编译、仿真和测试阶段独立呈现，后续阶段失败不再覆盖已经通过的编译结论。

### 改进

- CODESYS 增加实际 Scripting 能力验证，以及安装/修复入口；首次选最高版本，用户保存后固定。
- TIA 与 CODESYS 工作区结果完全隔离；增加最近 30 天任务记录和手动检查更新入口。
- 云端状态文件使用原子写入，并识别过期状态。
- Markdown 说明使用本机即时阅读器，增强排版交给系统浏览器，不依赖 WebView2。

### 验证

- 完整 Release Rebuild 通过，六个 EXE 的文件版本均为 `0.4.4.0`。
- UI 自动回归通过，覆盖 150% DPI、TIA 连接证据、CODESYS 阶段状态和对话框布局。
- v0.4.4 Release regression：22/22 通过。
- CODESYS Doctor 确认 SP21 Patch 5、Scripting 4.2.0.0 及两个仿真 Runtime 已发现；完整无界面运行在本机超时，因此仍需用户点击“验证 Scripting”完成环境验收。

### 已知限制

- 安装包尚未使用可信代码签名证书签名。
- 当前构建机未安装 TIA Portal，TIA V21+ 与各旧版本仍需在对应真机完成最终 Openness 验收。

## [0.4.3] - 2026-09-11

> 早期公开测试版（Pre-release）

### 新增

- 支持 TIA Portal V21+ 模块化 Openness PublicAPI，并兼容传统版本入口。
- TIA 与 CODESYS 首次运行自动选择本机最高版本，后续保持用户选定版本。
- CODESYS 配置窗口增加 Scripting 安装/修复入口。
- 文档说明改用即时原生渲染，并支持系统浏览器打开本地增强排版。

### 改进

- 默认云端连接改为 RealPLC 正式云端，并保留已有用户配置。
- 优化高 DPI 下按钮、版本选择框、说明区域、状态栏和详情区域布局。
- 精简主窗口、“更多”菜单和托盘菜单中的重复功能。
- 删除 WebView2 编译、运行及安装依赖，改善首次打开速度和安装成功率。

### 验证

- CODESYS：97 项测试通过，类型检查通过。
- TIA 离线验证：48/48 通过；SimaticML：53/53 通过。
