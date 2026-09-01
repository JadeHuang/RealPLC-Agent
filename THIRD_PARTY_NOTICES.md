# RealPLC Agent v0.4.1 第三方组件说明

本文件列出正式运行包直接使用或由安装程序检测的第三方组件。历史测试后端、Mock Gateway 和外部参考项目不进入默认生产发布目录。

## Markdig

- 组件：Markdig
- 版本：0.18.3
- 许可证：BSD-2-Clause
- 来源：构建时从 NuGet 官方源恢复，或由离线构建缓存预先提供。
- 用途：内置 Markdown 文档到 HTML 的必要转换器。
- 发布要求：保留 NuGet 包中的许可证和版权声明。

当前版本固定使用其 `net40` 程序集，以降低传统 .NET Framework 4.8 工程的传递依赖和真机部署变量。升级 Markdig 版本必须经过 Windows 编译、Markdown 兼容性和离线依赖回归，不允许静默漂移版本。

## Microsoft Edge WebView2 SDK

- 组件：Microsoft.Web.WebView2 SDK
- 版本：1.0.4078.44
- 来源：构建时从 NuGet 官方源恢复。
- 用途：在 WinForms 中显示经过清理的本地文档 HTML。
- 安全配置：JavaScript、开发者工具和默认右键菜单关闭，并设置限制性 CSP。

正式运行还需要 Microsoft Edge WebView2 Evergreen Runtime。完整离线安装包使用 Microsoft 官方 x64 Standalone Installer；该微软二进制由 Microsoft 授权条款约束。

## Microsoft .NET Framework 4.8

Agent 目标运行时为 .NET Framework 4.8。安装器仅在系统缺失时调用 Microsoft 官方离线 Runtime 安装程序；该组件由 Microsoft 授权条款约束。

## Siemens TIA Portal Openness

- `Siemens.Engineering.dll` 等 PublicAPI 文件由用户本机安装的 TIA Portal / Openness 提供。
- RealPLC Agent 的 TIA Connector 在运行时定位并加载对应 PublicAPI。
- RealPLC Agent 不重新分发 Siemens 专有 DLL。

## CODESYS

- CODESYS IDE、CODESYS Scripting、设备描述和相关运行时由用户通过 CODESYS 官方或 OEM 渠道安装并授权。
- RealPLC Agent 不重新分发 CODESYS 专有 DLL 或官方 `.package` 文件。

## 外部引擎边界

外部 TIA/MCP 工程如需接入，应通过独立进程、CLI 或适配器边界调用。MIT、Apache-2.0、BSD 等许可证代码必须保留原始声明；GPL/AGPL、未知许可证和商业专有代码不得默认复制进 RealPLC 二进制。

### CODESYS MCP SP21+ 参考审计

- 项目：`phobicdotno/Codesys-MCP-SP21-plus`
- 许可证：MIT
- 审计固定提交：`22bd232ea0fce482d4e1fe705f95ba4bdd2f9a6a`
- 用途：仅作为可选 MCP 适配器和 SP21 自动化可行性参考；V1 核心验证链不加载、复制或分发该项目代码，也不依赖 MCP 才能运行。
