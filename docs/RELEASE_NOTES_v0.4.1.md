# RealPLC Agent v0.4.1 Release Notes

> 发布类型：早期公开测试版（Pre-release）
> 发布日期：2026-09-01

v0.4.1 是一次稳定性修订，保持现有 RealPLC Agent 业务流程不变，重点改善版本一致性、TIA/CODESYS 路径发现、配置写入可靠性和 WinForms 高 DPI 布局。

## 主要变更

- 修正 TIA Connector Manifest 和安装器中遗留的 v0.4.0 版本信息。
- 构建结束前校验 6 个发布 EXE 和 TIA Connector Manifest，防止旧二进制误入发布包。
- CODESYS/TIA 自动发现扩展至所有已就绪的本地固定磁盘，改善自定义安装目录、`net48` 路径和手动选择。
- CODESYS 兼容策略为 V3.5 SP15+，不再硬编码 SP22 上限。
- 修正 CODESYS Patch 版本解析和无法识别版本时的误接受问题。
- 配置文件使用原子替换，并保留新版 Connector 可能写入的未知扩展字段。
- 目录深度遍历跳过重解析点，避免循环和重复扫描。
- 按钮、标签、下拉框、对话框和工具栏采用更稳健的自适应布局，改善高 DPI、中文字体和窄窗口显示。

## 验证结果

- Review regression：14/14 PASS
- SimaticML：53/53 PASS
- Offline Worker 集成/安全用例：48/48 PASS
- Protocol regression：17/17 PASS
- 完整 Release Rebuild：PASS（0 错误）
- 6 个发布 EXE：FileVersion 均为 `0.4.1.0`

## 下载与安全

请仅从本仓库 v0.4.1 Release 页面下载 `RealPLC_Agent_v0.4.1_Setup.exe`，并将 PowerShell `Get-FileHash` 结果与同页的 `.sha256` 资产核对。

当前安装包尚未使用可信代码签名证书签名，Windows 可能显示 SmartScreen 警告。请仅在测试工程、工程副本、虚拟 PLC 或隔离环境中使用，不得未经工程师确认将 AI 生成内容直接用于生产设备。

## 尚需真机验收

- Siemens TIA Portal 真实项目附加、快照和编译。
- 真实 CODESYS IDE 的 compile/simulation 闭环。
- 不同 OEM、Profile、Service Pack、Patch 和插件组合的兼容性。
