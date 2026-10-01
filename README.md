# RealPLC Agent v1.1.1

RealPLC Agent 运行在 Windows 本地，把 RealPLC AI 生成的 PLC 程序送入真实 CODESYS 与 Siemens TIA Portal 工程环境完成验证。

## v1.1.1

- TIA Portal 可见验证：打开或创建工程、导入候选程序、启动原生编译并读取块级诊断。
- 根据编译诊断在同一 Run 内再次导入修复候选，持续执行编译和修复循环。
- TIA Portal 首次打开工程需要 Openness 授权时，提示用户在 TIA 窗口中完成一次授权。
- 支持 CODESYS 闭环验证、Diagnostics 返回和 AI 修复。
- 修复原生验证建运行记录时运行计划 ID 超长导致的数据库写入失败。

核心流程：

```text
需求 → AI 生成 → 导入工程 → 原生编译 → 诊断 → 修复 → 再次验证
```

## 下载

[下载 RealPLC Agent v1.1.1（Windows x64）](https://github.com/JadeHuang/RealPLC-Agent/releases/tag/v1.1.1)

安装器：`RealPLC_Agent_V1.1.1_Setup_x64.exe`

SHA-256：`A7C16A1ED357FFD02C7743DC906BC8C06CD428B569BDBED1C1FAFE8BEA6CF74A`

直接下载：
https://github.com/JadeHuang/RealPLC-Agent/releases/download/v1.1.1/RealPLC_Agent_V1.1.1_Setup_x64.exe

## 本地接口

```text
Data Studio  http://127.0.0.1:18738/data-studio/
Active HMI   http://127.0.0.1:18738/hmi/{deploymentId}/
Health       http://127.0.0.1:18738/health
```

## 系统要求

- Windows 10/11 x64，安装程序需要管理员权限。
- CODESYS V3.5 SP15+ 及官方 Scripting 组件。
- TIA Portal 与对应版本的 Openness 组件。

## 验证

- Openness harness：101/101
- CloudBridge target tests：33/33
- Release verification 与 HMI runtime self-test：PASS

问题请提交 [GitHub Issue](https://github.com/JadeHuang/RealPLC-Agent/issues)。
