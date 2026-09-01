# 支持与问题反馈

## 提交问题前

1. 确认安装包来自 [RealPLC-Agent Releases](https://github.com/JadeHuang/RealPLC-Agent/releases)。
2. 对照 [兼容性说明](docs/COMPATIBILITY.md) 检查 Windows、CODESYS 和 Scripting 组件。
3. 确认使用测试工程、工程副本或隔离环境复现。
4. 记录最小复现步骤，并保留错误出现时间附近的日志。

## 提交 Issue

请使用 [GitHub Issue 模板](https://github.com/JadeHuang/RealPLC-Agent/issues/new/choose)。报告中应包含：

- RealPLC Agent 版本；
- Windows 版本；
- CODESYS 完整版本、SP、Patch 和 Profile；
- 验证模式或级别；
- 预期结果与实际结果；
- 最小复现步骤；
- 已脱敏的截图和日志。

## 日志与本地数据

常用数据目录位于：

```text
%LOCALAPPDATA%\RealPLC
```

TIA 与 CODESYS 组件可能分别使用以下子目录：

```text
%LOCALAPPDATA%\RealPLC\TIAAgent
%LOCALAPPDATA%\RealPLC\CodesysValidation
%LOCALAPPDATA%\RealPLC\CodesysPrerequisites
```

提交前请删除或遮盖：

- 访问令牌、配对码、设备密钥和 Cookie；
- 客户、组织、项目和设备的真实名称；
- PLC 工程源码、IP 地址、网络拓扑和生产配方；
- Windows 用户名、绝对路径及其他个人信息。

## 安全问题

发现潜在安全漏洞时，请遵循 [安全策略](SECURITY.md)，不要在公开 Issue 中披露利用细节、凭据或客户数据。
