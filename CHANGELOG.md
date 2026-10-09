# 更新日志

本项目遵循 [Semantic Versioning](https://semver.org/) 进行版本管理。预发布版本使用 `-alpha`、`-beta.N` 或 `-rc.N` 后缀；已发布的版本文件和标签不覆盖、不复用。

## [1.1.2] - 2026-10-09

> 正式 Release（公开测试），解决界面卡顿、加快启动，并在主页显示所连接的 IDE 版本。

### 修复

- 装有 CODESYS 的电脑上窗口每隔几秒卡住：CODESYS 状态检测改为只查官方安装位置、结果保留 30 秒，并移到后台执行；Agent 留在托盘时也不再长时间占用一个 CPU 核。
- CODESYS Connector 对话框要等检测完成才出现：现在立即打开，检测结果随后填入。
- “启动/检查本地服务”“打开 Data Studio”、RealPLC HMI 对话框、“加入 Openness 用户组”和开机自启设置执行时窗口无响应。
- 云端连接停止后的 20 秒内，窗口每秒卡顿一次。
- 运行中捕获的错误不再显示为“启动失败”。

### 改进

- 窗口不再等 AgentHost 启动完成才出现；重复启动 Agent 会把已有窗口调到前台。
- 主页的平台按钮和状态栏直接显示所连接的 IDE 版本，例如“TIA V18”“CODESYS SP21 P5”；鼠标悬停可查看完整版本和安装路径。
- CODESYS IDE 打开时也可以验证 Scripting，耗时约为平时的两倍。
- 修复重连 TIA 时，同样提示用户在 TIA 窗口完成 Openness 授权。

### 验证

- Openness harness：106/106；CloudBridge target tests：33/33。
- 发布校验与 HMI Runtime 自检通过。
- 界面响应性测试、直接启动测试、由 AgentHost 拉起启动的测试通过。
- 同一台开发机、同等负载下与 v1.1.1 对比：启动到窗口显示 33 秒 → 3～5 秒；空闲时最长无响应 9.8 秒 → 0.1～0.2 秒；打开 CODESYS Connector 对话框 44 秒 → 0.5～2 秒；托盘空闲时占用一个 CPU 核的 56% → 1～4%。
- 发布安装包：`RealPLC_Agent_V1.1.2_Setup_x64.exe`；同一文件另以固定文件名 `RealPLC-TIA-Agent-Setup-x64.exe` 提供。
- 安装包 SHA-256：`265AEC60F28BE8B57C23653C333288CEE6B682681390914676829DC1EE45D779`。

### 已知限制

- “连接云端”和环境向导中的用户组检查仍在界面线程执行，通常不到一秒。
- 程序尚未声明 DPI 感知，在缩放高于 100% 的显示器上由系统拉伸显示。
- 安装包尚未使用可信代码签名证书签名。
- 当前构建机未安装 TIA Portal，TIA 相关改动仍需在装有 TIA Portal 的环境验收。

## [1.1.1] - 2026-10-01

> 正式 Release（公开测试），完善可见 TIA Portal 验证链路。

### 改进

- 在可见的 TIA Portal 会话中完成验证与修复：打开或创建验证工程、导入候选程序、执行原生编译并返回块级诊断；同一次运行内可导入修复后的候选程序再次编译。
- Openness 进度与编译诊断按事件顺序上报，工作区可以显示 TIA 当前在做什么。

### 修复

- 运行计划审批 ID 不再被截断，自动原生验证建立运行记录时不再因数据库字段长度失败。

### 验证

- Openness harness：101/101；CloudBridge target tests：33/33。
- 发布校验与 HMI Runtime 自检通过。
- 发布安装包：`RealPLC_Agent_V1.1.1_Setup_x64.exe`。
- 安装包 SHA-256：`A7C16A1ED357FFD02C7743DC906BC8C06CD428B569BDBED1C1FAFE8BEA6CF74A`。

### 已知限制

- 首次 Openness 授权仍需用户在 TIA 窗口中确认。

## [1.1.0] - 2026-09-29

> 正式 Release（公开测试），完善 TIA Portal 自动化、Worker、CloudBridge 与目标项目编译链路。

### 新增

- TIA 项目发现：获取已打开的 TIA 项目、PLC、TIA Portal 版本和 Program Cycle OB 信息。
- Target Project：`validate-scl` 可在指定的目标项目中编译；目标项目不存在时自动创建或复制，不直接修改用户自己的原始项目。
- CloudBridge Job Contract 与 Validation Job，打通 Agent → CloudBridge → Worker → TIA Portal → Result 的返回链路。
- Data Studio 支持将 HMI 画面与 OPC UA 变量绑定。

### 改进

- 安装程序自动把 TIA Openness Worker 注册到 whitelist，卸载时清理。
- Release 可以构建到独立的 staging 目录，打包时无需停止正在运行的 Agent。
- 改进 HMI Activation 流程，激活失败时不留下运行中的残余。

### 验证

- 发布安装包：`RealPLC_Agent_V1.1.0_Setup_x64.exe`。
- 安装包 SHA-256：`C46DA71EE81E5DCC93A241B6276056F8E4F9064334C447F509AC53F86BB778DA`。

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
