# 输送线启停演示 RUNBOOK

按本说明可以在 **RealPLC Agent v1.1.4** 和 **CODESYS** 上走完一条闭环：

**生成 → 编译通过 → 导入注入错误 → 拿到诊断 → 修复 → Rebuild 复验通过。**

需求与 I/O 以 [REQUIREMENT.md](REQUIREMENT.md) 为准。官网画面或旧模板与该文件不一致时，以该文件为准。

## 环境

| 项目 | 演示基线 |
| --- | --- |
| RealPLC Agent | v1.1.4 |
| CODESYS | V3.5 SP21 Patch 5（界面上可为 SP21 P5） |
| CODESYS Scripting | 4.2.0.0，且 Agent 中的 Scripting 能力验证通过 |
| 工程 | 测试工程，或从测试工程复制的副本 |
| 标准库 | 工程引用 CODESYS Standard 库（提供 `TON`、`R_TRIG`）。标准工程默认已引用 |
| 源文件编码 | UTF-8 |

演示开始前核对 Agent 关于页或主页版本、主页显示的 CODESYS 版本，以及 Scripting 版本。与上表不同时，把实际版本记入记录，仍只使用测试工程或副本。

## 安全边界

- 只使用测试工程或工程副本。
- 验证停在编译和可选的 IDE Simulation。
- 不把程序下载到控制器、生产 PLC 或生产设备。

Agent 的 CODESYS 验证链本身不会自动下载到真实 PLC。演示时也不要手动下载。

## 文件

| 文件 | 用途 |
| --- | --- |
| `REQUIREMENT.md` | I/O 契约与四条验收 |
| `FB_Conveyor.st` | 可编译的正确功能块，演示中当作「生成结果」 |
| `PLC_PRG.st` | 功能块实例和示例 I/O 变量 |
| `FB_Conveyor_injected_error.st` | 演示用注入错误，编译必须失败 |
| `RUNBOOK.md` | 本说明 |

本目录的正确 ST 用来固定复现，不依赖当次云端生成。若另行让 RealPLC AI 生成，生成结果的 I/O 仍须与 `REQUIREMENT.md` 一致；导入工程后再从第 3 步编译。

## 导入方式

CODESYS 把声明和实现分开放。对每个 `.st`：

1. 新建对应 POU，实现语言选择 **Structured Text (ST)**。功能块名称 `FB_Conveyor`，程序名称 `PLC_PRG`。工程里已有 `PLC_PRG` 时，替换现有内容，不要新建第二个程序。
2. **声明**粘贴变量区：从 `VAR_INPUT` 或 `VAR` 起到最后一个 `END_VAR`，含行尾注释。编辑器若已经有 `FUNCTION_BLOCK FB_Conveyor` 或 `PROGRAM PLC_PRG`，不要再贴一次。文件开头的 `(* *)` 说明可以不贴进工程。
3. **实现**只粘贴「以下为实现部分」之后的可执行语句。不要把 `FUNCTION_BLOCK`、`PROGRAM`、`VAR` 块、`END_FUNCTION_BLOCK` 或 `END_PROGRAM` 贴进实现编辑器。
4. 先保存 `FB_Conveyor`，再保存 `PLC_PRG`。

替换注入错误或修复时，只改 `FB_Conveyor` 的实现，保留 `PLC_PRG`。

## 步骤

### 1. 准备副本

复制一份 CODESYS 测试工程，用 Agent v1.1.4 连接这台机器上的 CODESYS SP21 P5。后续编译都针对这份副本。

### 2. 导入正确 ST

把 `FB_Conveyor.st` 和 `PLC_PRG.st` 按上一节导入副本。这一步对应闭环里的「生成」：正确功能块就是待验证的生成结果。

### 3. 第一次编译，期望通过

用 Agent 的 CODESYS 验证编译该副本，或在 CODESYS 中执行一次全量编译。

期望：0 error。有 Standard 库未引用、POU 重名、把声明贴进实现区一类问题时，先处理到 0 error，再进入下一步。通过后再开始注入，避免和故意制造的类型错误混在一起。

### 4. 导入注入错误，拿到诊断

用 `FB_Conveyor_injected_error.st` 的实现替换 `FB_Conveyor`。错误点已用注释标出「演示用注入错误」：`MotorRun`（`BOOL`）被赋成 `FbTimeout`（`TIME`）。

再次编译。

期望：编译失败。诊断中能看到类型不匹配（CODESYS 常见表述是不能把 `TIME` 转换到 `BOOL`），并保留完整诊断文本。这一步对应「编译失败 → 诊断」。

### 5. 修复

任选一种，使功能块实现与 `FB_Conveyor.st` 一致：

- 用 `FB_Conveyor.st` 的实现覆盖当前 POU；
- 或删掉 `MotorRun := FbTimeout;`，改回文件注释里的 BOOL 表达式。

不要只在对话或笔记里写下修复。修复必须写回这份测试副本里的 POU。

### 6. 复验通过：Rebuild 门禁

修复后的通过结论只来自下面两条路径之一。

**路径 A — Rebuild**

在当前副本上执行 **Build → Rebuild**。中文界面选择会重新编译全部代码的命令（常见名称是「重新编译」），不要选普通的增量编译。

**路径 B — 全新工程副本**

另复制一份干净的测试工程，只导入修复后的 `FB_Conveyor.st` 与原来的 `PLC_PRG.st`，在该新副本上做首次全量编译。

期望：0 error，诊断里不再出现第 4 步的类型错误。

增量 **Build** 如果提示 **application is current**（中文界面可能显示应用程序已是最新、无需重新生成或等价说明），这次操作没有完成复验。该提示只表示工程系统认为没有需要重编的更改。看到它之后，改为路径 A 或路径 B，用新的编译结果作为通过证据。不要把这句话记成通过。

IDE 登录时若出现 “application is current” 或 “无需下载”，同样不能代替 Rebuild 的编译结果。

## 可选：IDE Simulation 检查清单

编译已按第 6 步通过后，可以在 IDE Simulation 里按顺序核对四条验收。只仿真，不下载。

初值：`EStopOk = TRUE`，其余输入为 FALSE。期望 `MotorRun = FALSE`，`FaultLatched = FALSE`。每个上升沿都是先把该按钮置 FALSE，再置 TRUE。反馈超时的初值是 `T#3S`。做完一步再做下一步。

第 2 步到第 6 步：每次 `MotorRun` 变为 TRUE 后，马上把 `RunningFb` 置 TRUE，表示电机已有反馈。否则运行命令保持超过 3 秒会先触发反馈超时，停止、急停和过载还没操作，故障就已经锁存。第 7 步再专门把反馈撤掉。

| 步骤 | 验收 | 操作 | 期望 |
| --- | --- | --- | --- |
| 1 | S01 运行许可 | `S01_PartDetect = FALSE` 时给出 `StartPb` 上升沿，然后把 S01 置 TRUE | 上升沿之后 `MotorRun` 仍为 FALSE |
| 2 | 1 停止 | S01 为 TRUE，`StartPb` 上升沿；确认运行后再把 `StopPb` 置 TRUE，然后松开 | 启动后 `MotorRun = TRUE`。停止置 TRUE 的同一周期 `MotorRun = FALSE`，松开后仍为 FALSE |
| 3 | 1 急停 | 再次给出启动上升沿，然后 `EStopOk = FALSE`，再恢复为 TRUE | 急停生效的同一周期 `MotorRun = FALSE`。恢复急停后仍为 FALSE |
| 4 | 2 过载 | 再次启动，把 `OverloadTrip` 置 TRUE，再清回 FALSE | `FaultLatched = TRUE` 且 `MotorRun = FALSE`。过载消失后锁存仍为 TRUE |
| 5 | 3、4 | 保持 `StartPb = TRUE`，给出 `ResetPb` 上升沿 | `FaultLatched = FALSE`，`MotorRun` 仍为 FALSE。按住启动不能在复位时把电机带起来 |
| 6 | 仍可正常启动 | 松开 `StartPb`，再给一次新的启动上升沿 | `MotorRun = TRUE` |
| 7 | 2 反馈超时 | 把 `RunningFb` 置 FALSE，等待超过 3 秒 | `FaultLatched = TRUE`，`MotorRun = FALSE` |
| 8 | 3、4 | 松开 `StartPb`，给出 `ResetPb` 上升沿 | 锁存清除，`MotorRun` 仍为 FALSE |
| 9 | 反馈正常 | 再次启动，并在 3 秒内把 `RunningFb` 置 TRUE | `FaultLatched` 保持 FALSE，`MotorRun` 保持 TRUE |

## 失败时附上的材料

演示没有得到上面对应步骤的期望结果时，提交 Issue 或内部记录请附上：

- RealPLC Agent 版本（本演示基线 v1.1.4）
- Windows 版本与系统架构
- CODESYS 完整版本、SP、Patch 和 Profile（本演示基线 V3.5 SP21 P5）
- CODESYS Scripting 版本（本演示基线 4.2.0.0），以及 Agent 里 Scripting 能力验证是否通过
- 工程是测试工程还是副本；确认没有对生产设备下载
- 导入的文件名，以及当时 POU 里是正确实现还是注入错误
- 使用的是 Build、Rebuild，还是全新副本上的首次编译
- 若出现 “application is current” 或中文等价提示，贴出原文
- 编译诊断原文：错误号、行号、信息
- 已脱敏的 Agent 日志。日志目录见 [支持说明](../../../SUPPORT.md)，通常在 `%LOCALAPPDATA%\RealPLC`
- 可选：IDE Simulation 检查清单中失败的那一行，以及当时的输入和 `MotorRun`、`FaultLatched`

提交前去掉项目源码中的客户名称、访问令牌、配对码和设备密钥。

## 通过标准

同时满足下面三项，这条演示才算完成：

1. 正确 ST 的编译结果为 0 error。
2. 注入错误的编译失败，并留下类型不匹配诊断。
3. 修复之后，Rebuild 或全新工程副本上的全量编译为 0 error。通过记录里写明使用了哪一条复验路径。
