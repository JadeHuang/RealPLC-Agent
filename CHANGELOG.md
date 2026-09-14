# 更新日志

本项目遵循 [Semantic Versioning](https://semver.org/) 进行版本管理。预发布版本使用 `-alpha`、`-beta.N` 或 `-rc.N` 后缀；已发布的版本文件和标签不覆盖、不复用。

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
- UI 自动回归通过，包含 150% 缩放场景。
- 更新源元数据、完整安装包下载和 SHA-256 校验通过。

### 已知限制

- 安装包尚未使用可信代码签名证书签名。
- TIA V21+ 真实 Openness 连接仍需在装有对应版本 TIA Portal 的电脑上验收。

## [0.4.1] - 2026-09-01

> 早期公开测试版（Pre-release）

### 修复

- 统一 Agent、TIA Connector Manifest、安装器和发布 EXE 的 v0.4.1 版本链。
- CODESYS 和 TIA 安装发现扩展至所有已就绪的本地固定磁盘，改善非标准安装路径和手动选择。
- 修正 TIA PublicAPI `net48` 目录解析、CODESYS Patch 版本解析和无法识别版本时的误接受问题。
- 配置保存改为保留未知扩展字段并使用原子替换，降低异常中断造成的文件截断风险。
- 深度目录扫描跳过重解析点，避免循环遍历。
- 改善 WinForms 页面在高 DPI、中文字体和窄窗口下的按钮、标签、下拉框和工具栏布局。
- 修复离线 Worker 测试源文件漏项以及回归脚本对 Python Launcher 的不必要依赖。

### 验证

- Review regression：14/14 PASS。
- SimaticML：53/53 PASS。
- Offline Worker 集成/安全用例：48/48 PASS。
- Protocol regression：17/17 PASS。
- 完整 Release Rebuild：0 错误；6 个发布 EXE 的 FileVersion 均为 `0.4.1.0`。

### 已知限制

- 安装包尚未使用可信代码签名证书签名。
- 真实 TIA Portal 项目附加以及真实 CODESYS IDE 编译/仿真需要在安装了对应工程软件的机器上完成最终验收。

## [0.4.0] - 2026-08-31

> 早期公开测试版（Pre-release）

### 新增

- RealPLC AI 与 Windows 本地 Agent 的连接链路。
- CODESYS 工程闭环验证、原生编译与 Diagnostics 回传。
- AI 分析验证错误并继续修复的基础流程。
- Agent 本地运行状态、日志与连接信息。
- CODESYS V3.5 SP15–SP22 的安装发现与能力检查，重点验证 SP21。
- 工程副本与本地验证数据隔离。

### 安全边界

- CODESYS V1 验证链不自动下载到真实 PLC。
- 不自动下载到 Control Win 或 SoftMotion Runtime。
- 建议仅在测试工程、工程副本、虚拟 PLC 或隔离环境中使用。

### 已知限制

- 安装包尚未使用可信代码签名证书签名，Windows 可能显示安全警告。
- 不同 OEM IDE、CODESYS Profile、补丁版本和第三方插件可能影响兼容性。
- 多轮自动修复、验证历史和标准化报告仍在持续完善。

[0.4.1]: https://github.com/JadeHuang/RealPLC-Agent/releases/tag/v0.4.1
[0.4.0]: https://github.com/JadeHuang/RealPLC-Agent/releases/tag/v0.4.0
[0.4.3]: https://github.com/JadeHuang/RealPLC-Agent/releases/tag/v0.4.3
[0.4.4]: https://github.com/JadeHuang/RealPLC-Agent/releases/tag/v0.4.4
