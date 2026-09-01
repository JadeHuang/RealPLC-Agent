# 更新日志

本项目遵循 [Semantic Versioning](https://semver.org/) 进行版本管理。预发布版本使用 `-alpha`、`-beta.N` 或 `-rc.N` 后缀；已发布的版本文件和标签不覆盖、不复用。

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
