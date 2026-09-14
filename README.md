<p align="center">
  <img src="assets/realplc-icon.png" alt="RealPLC" width="80">
</p>

<h1 align="center">RealPLC Agent</h1>

<p align="center">
  <strong>让 AI 生成的 PLC 程序，进入真实工业软件完成闭环验证。</strong>
</p>

<p align="center">
  RealPLC AI × CODESYS × Siemens TIA Portal
</p>

<p align="center">
  <a href="https://www.realplc.com">官网</a> ·
  <a href="https://github.com/JadeHuang/RealPLC-Agent/releases/tag/v0.4.4">下载 v0.4.4</a> ·
  <a href="https://github.com/JadeHuang/RealPLC-Agent/issues">问题反馈</a> ·
  <a href="CHANGELOG.md">更新日志</a>
</p>

---

## 🚀 RealPLC Agent 是什么？

**RealPLC Agent** 是运行在 Windows 本地的工业软件连接组件。

它负责连接 **RealPLC AI** 与本机 PLC 开发环境，让 AI 不仅能够生成 PLC 程序，还可以进一步进入真实工程环境进行验证。

当前版本：

> **v0.4.4 — TIA V21+ 与多版本兼容、CODESYS 快速修复及原生文档体验**

---

## 🔄 CODESYS 闭环验证

传统 AI PLC 编程：

```text
需求
 ↓
AI 生成 ST
 ↓
人工复制到 CODESYS
 ↓
手动编译和修改
```

RealPLC v0.4.4：

```text
用户需求
   ↓
RealPLC AI
   ↓
生成 ST
   ↓
RealPLC Agent
   ↓
CODESYS
   ↓
真实验证
   ↓
Diagnostics
   ↓
AI 分析 / 修复
   ↓
再次验证
```

我们的目标很简单：

> **AI 不再自己判断代码“应该可以运行”，而是交给真实 PLC 工程环境验证。**

---

## ✨ v0.4.4 主要功能

- 🤖 AI 生成 PLC Structured Text 程序
- 🔗 RealPLC Agent 本地连接
- ⚙️ CODESYS 工程闭环验证
- 🔍 获取真实验证结果
- 🧾 Diagnostics 诊断结果返回
- 🔄 支持 AI 分析错误并继续修复
- 📋 Agent 本地运行状态与日志
- 🛡️ 云端 AI 与本地工程环境分离
- 💽 在所有已就绪的本地固定磁盘上发现 CODESYS/TIA 安装
- 📂 支持手动选择非标准安装路径
- 🖥️ 改善 Windows 高 DPI、中文字体与窄窗口下的界面布局
- ✅ 构建时强制校验发布 EXE 与 Connector Manifest 版本
- 🔷 兼容 TIA Portal V21+ 模块化 Openness PublicAPI，同时保留旧版本入口识别
- 🎯 首次自动选择本机最高 TIA/CODESYS 版本，之后固定使用用户手动选择
- 🧰 CODESYS Scripting 缺失时可从 Agent 中直接安装或修复
- 📖 说明文档使用即时原生渲染，可用系统浏览器打开本地增强排版，无需 WebView2
- 📡 TIA 状态以真实 Openness 成功操作为依据，避免进程扫描误报“未运行”
- 🎛️ 多个 TIA 实例同时打开项目时要求明确选择 ProcessId，避免连接错误工程
- 🧪 CODESYS 增加实际 `--runscript --noUI` 能力验证，区分组件文件存在和真正可用
- 🗂️ TIA 与 CODESYS 的项目树、诊断、摘要和原始结果按工作区隔离
- 🕘 提供最近 30 天任务记录和“更多 → 检查软件更新”入口

核心流程：

**Generate → Validate → Diagnose → Fix → Validate Again**

---

## 📥 下载

**[⬇️ 打开 RealPLC Agent v0.4.4 发布页（Windows x64）](https://github.com/JadeHuang/RealPLC-Agent/releases/tag/v0.4.4)**

| 项目 | 信息 |
| --- | --- |
| 文件名 | `RealPLC_Agent_V0.4.4_Setup_x64.exe` |
| 文件大小 | 146,362,561 字节 |
| SHA-256 | 与安装包一同在 Release 资产中发布 |
| 发布状态 | 正式 Release（公开测试） |
| 数字签名 | 当前安装包尚未签名 |

可在 PowerShell 中校验下载文件：

```powershell
Get-FileHash .\RealPLC_Agent_V0.4.4_Setup_x64.exe -Algorithm SHA256
```

请将计算结果与 v0.4.4 Release 资产中的 `.sha256` 文件核对。

安装完成后启动：

```text
RealPLC Agent
```

按照 Agent 界面的提示连接 RealPLC 与 CODESYS。

### 系统要求

- Windows 10/11 x64；安装程序需要管理员权限。
- CODESYS V3.5 SP15 及更高 Service Pack；首次运行默认选择已发现的最高版本，用户选择后保持固定。
- 需要官方 CODESYS Scripting 组件才能执行 IDE 自动化验证。
- TIA Portal Openness 支持传统 `Siemens.Engineering.dll` 入口及 V21+ `Siemens.Engineering.Base.dll` 模块化入口；需安装对应版本的 Openness 组件。
- 安装程序在系统缺失时提供 .NET Framework 4.8 安装支持；文档查看不依赖 Microsoft Edge WebView2 Runtime。
- 需要网络连接 RealPLC 服务；PLC 工程验证在本机执行。

不同 OEM IDE、Profile、补丁版本和工程插件可能影响兼容性。遇到问题请在 Issue 中附上完整版本信息。

---

## 🧪 使用建议

v0.4.4 仍属于早期公开测试版本。

建议优先使用：

- CODESYS 测试工程
- 工程副本
- 虚拟 PLC
- Sandbox 环境

> ⚠️ 请勿未经工程师确认，直接将 AI 生成的程序用于真实生产设备。

### 安全与数据边界

- CODESYS V1 验证链支持原生编译和 IDE Simulation，不自动下载到真实 PLC 或 Control Win/SoftMotion Runtime。
- 工程验证在本机沙箱或工程副本中执行，云端与本地工程环境保持分离。
- 日志和验证数据保存在当前 Windows 用户的本地应用数据目录中。
- 提交 Issue 前请删除项目源码、访问令牌、设备密钥、客户名称和其他敏感信息。

详细说明请参阅 [数据与隐私说明](DATA_AND_PRIVACY.md) 和 [安全策略](SECURITY.md)。

---

## 🔜 下一步

### ⚙️ CODESYS

继续完善：

- AI 自动修复
- 多轮闭环验证
- Diagnostics 标准化
- 验证历史与报告
- Agent 稳定性

### 🔷 Siemens TIA Portal

下一阶段将重点推进：

- TIA Portal Openness 真机兼容回归
- PLC 工程读取
- OB / FB / FC / DB
- SCL 导入
- Compile
- Diagnostics
- AI 自动修复
- TIA 编译闭环验证

```text
RealPLC AI
     ↓
RealPLC Agent
     ↓
TIA Portal Openness
     ↓
TIA Portal
     ↓
Compile / Diagnostics
```

---

## 🗺️ Roadmap

- RealPLC Agent 本地运行框架
- CODESYS 闭环验证
- 验证结果回传
- Diagnostics 基础链路
- AI 自动修复
- 多轮自动验证
- 验证历史与报告
- TIA Portal 多版本 Openness
- TIA Compile 闭环与自动版本切换
- 更多 PLC 开发平台

---

## 🐛 问题反馈

如果遇到：

- Agent 连接问题
- CODESYS 兼容问题
- 验证失败
- 安装问题
- Diagnostics 异常

欢迎提交 [GitHub Issue](https://github.com/JadeHuang/RealPLC-Agent/issues/new/choose)。

提交问题时建议附带：

- RealPLC Agent 版本
- Windows 版本
- CODESYS 版本
- TIA Portal 版本（如适用）
- 错误截图
- Agent 日志

更多排障信息请参阅 [支持说明](SUPPORT.md)。

---

## 🌐 About RealPLC

**RealPLC** 是面向 PLC 与工业自动化工程师的 AI 工程平台。

我们希望让 AI 从：

```text
PLC Code Generator
```

逐渐进化成为：

```text
PLC Engineering Agent
```

最终实现：

> **理解需求 → 生成代码 → 真实验证 → 发现错误 → 自动修复 → 再次验证**

🌐 **Website:** [https://www.realplc.com](https://www.realplc.com)

## 📚 项目文档

- [v0.4.4 发布说明](docs/RELEASE_NOTES_v0.4.4.md)
- [更新日志](CHANGELOG.md)
- [兼容性说明](docs/COMPATIBILITY.md)
- [支持与问题反馈](SUPPORT.md)
- [数据与隐私说明](DATA_AND_PRIVACY.md)
- [安全策略](SECURITY.md)
- [第三方组件声明](THIRD_PARTY_NOTICES.md)
- [版本发布流程](docs/RELEASE_PROCESS.md)
- [许可声明](LICENSE.md)

---

<p align="center">
  <strong>RealPLC Agent v0.4.4</strong>
</p>

<p align="center">
  AI × PLC × CODESYS × TIA Portal
</p>
