# RealPLC Agent v0.4.4

本版本重点修复“操作已经成功，但状态仍显示未运行”的连接判断问题，并把 TIA、CODESYS、文档和升级流程整理为可验证的产品闭环。

## TIA Portal

- 支持 V21+ 的 `Siemens.Engineering.Base.dll` 与旧版本的 `Siemens.Engineering.dll`。
- 首次扫描自动选择最高版本；用户保存选择后固定使用该版本。
- 状态由 `list-open-projects`、快照或编译等真实 Openness 成功结果确认，证据超过 30 秒提示复查。
- 多个实例同时打开项目时必须明确选择 `ProcessId`。
- 环境向导只保留版本、Worker、用户组、实例、连接测试和快照验证六步。

## CODESYS

- 首次自动选择最高版本，之后保持用户选择。
- Connector 页面区分组件文件完整与实际 Scripting 能力验证。
- 提供“安装/修复 Scripting”和“验证 Scripting”按钮。
- 编译、代码生成、仿真和测试结果独立显示。

## UI 与稳定性

- TIA 与 CODESYS 的项目树、诊断、摘要和原始结果互相隔离。
- 修复高 DPI 下文字遮挡、按钮顺序、下拉框高度和底部状态对齐。
- 增加最近 30 天任务记录和手动检查更新入口。
- 云端状态文件采用原子写入并识别过期状态。
- Markdown 默认由本机控件即时渲染，浏览器增强排版按需打开，不再依赖 WebView2。

## 下载与升级

- 安装包：`RealPLC_Agent_V0.4.4_Setup_x64.exe`
- SHA-256：`6D9BBC0FDFF557F65412E17F6907843051A7C47A3F397AE5B2ED53504D282408`
- v0.4.4 作为正式 GitHub Release 发布，使 `/releases/latest` 能被 Agent 自动更新检查识别。

安装包当前未签名，Windows 可能显示发布者未知。安装程序会关闭旧 Agent 进程、保留用户配置，并在完成后启动新版本。
