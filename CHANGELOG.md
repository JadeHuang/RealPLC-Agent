# 更新日志

本项目遵循 [Semantic Versioning](https://semver.org/) 进行版本管理。预发布版本使用 `-alpha`、`-beta.N` 或 `-rc.N` 后缀；已发布的版本文件和标签不覆盖、不复用。

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

[0.4.0]: https://github.com/JadeHuang/RealPLC-Agent/releases/tag/v0.4.0
