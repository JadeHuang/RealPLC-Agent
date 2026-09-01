# 数据与隐私说明

本文说明 RealPLC Agent v0.4.0 的技术数据边界，不替代 RealPLC 服务适用的正式隐私政策或组织内部的数据治理要求。

## 本地处理

- PLC 工程读取、沙箱副本、编译和验证在用户的 Windows 设备上执行。
- 安装目录按只读程序目录使用；运行日志、状态和验证输出写入当前用户的本地应用数据目录。
- TIA 与 CODESYS 组件可能分别使用 `%LOCALAPPDATA%\RealPLC\TIAAgent`、`%LOCALAPPDATA%\RealPLC\CodesysValidation` 和 `%LOCALAPPDATA%\RealPLC\CodesysPrerequisites`。
- 本地凭据和设备绑定信息不应出现在命令行、公开日志或 GitHub Issue 中。

## 网络通信

Agent 需要通过 HTTPS/WSS 连接 RealPLC 服务，以完成设备绑定、Agent 状态、能力信息、验证任务、进度、结果和 Diagnostics 的交换。实际传输内容取决于用户发起的功能和任务。

组织在使用前应确认：

- 工程、诊断和日志是否允许由组织网络策略处理或传输；
- 代理、TLS 检查、防火墙和数据驻留要求；
- 客户合同、保密协议和行业监管要求；
- 哪些项目必须仅在隔离环境中验证。

## GitHub Issue 与日志脱敏

GitHub Issue 是公开信息。提交前必须删除或遮盖：

- PLC 工程源码、设备地址、网络拓扑和生产参数；
- 访问令牌、Cookie、配对码、设备密钥和认证头；
- 客户、组织、工程师和项目名称；
- Windows 用户名、绝对路径和其他个人信息。

不要把完整工程或未经审查的日志上传到公开 Issue。

## 数据清理

卸载软件不一定自动删除 `%LOCALAPPDATA%\RealPLC` 中的日志、缓存和验证输出，以便升级和故障恢复。需要清理时，应先停止 RealPLC Agent，确认不再需要相关验证记录，并按照组织的数据保留策略处理。
