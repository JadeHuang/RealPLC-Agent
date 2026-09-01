# 兼容性说明

本文记录 RealPLC Agent v0.4.1 的公开兼容范围。不同 OEM IDE、Profile、补丁、插件和工程结构可能造成差异；超出下述范围不代表一定无法运行，但需要单独验证。

## Windows

| 项目 | 支持情况 |
| --- | --- |
| Windows 10 x64 | 支持 |
| Windows 11 x64 | 支持 |
| 32 位 Windows | 不支持 |
| 安装权限 | 安装程序需要管理员权限 |
| .NET Framework | 需要 4.8；缺失时由安装程序提供离线安装 |
| WebView2 Runtime | 需要；缺失时由安装程序提供离线安装 |

最终用户不需要安装 Visual Studio、Node.js、Python 或源码构建工具。

## CODESYS

| 项目 | 支持情况 |
| --- | --- |
| CODESYS 版本 | V3.5 SP15 及更高 Service Pack（具体 OEM/Profile/Patch 组合需单独验证） |
| v0.4.1 重点改进 | 跨固定磁盘发现、非标准路径与手动选择 |
| 自动发现 | 选择受支持范围内已安装的版本，默认优先较高版本 |
| 自动化依赖 | 官方 CODESYS Scripting 组件 |
| 原生编译与诊断 | 支持 |
| IDE Simulation | 支持，取决于工程与 TestSpec 可测试性 |
| 真实 PLC 下载 | CODESYS V1 验证链禁用 |
| Control Win / SoftMotion 下载 | CODESYS V1 验证链禁用 |

以下情况应在投入使用前单独验证：

- OEM 定制版 CODESYS IDE；
- 非标准 Profile、Additional Folder 或设备描述；
- 依赖商业插件、专用编译器或自定义库的工程；
- 未经验证的 CODESYS Service Pack/Patch 组合；
- 网络盘、UNC 路径或受组织安全策略限制的工程目录。

## 网络与本地数据

- Agent 需要通过 HTTPS/WSS 访问 RealPLC 服务。
- PLC 工程处理、编译与验证在本机执行。
- 防火墙、代理、TLS 检查和组织网络策略可能影响连接。
- 日志及验证数据位于当前 Windows 用户的本地应用数据目录。

## 反馈兼容性问题

请使用 [兼容性问题模板](https://github.com/JadeHuang/RealPLC-Agent/issues/new/choose)，并提供：

- RealPLC Agent 版本；
- Windows 版本与系统架构；
- CODESYS 完整版本、SP、Patch 和 Profile；
- 是否安装官方 CODESYS Scripting；
- 验证级别、最小复现步骤和已脱敏日志。
