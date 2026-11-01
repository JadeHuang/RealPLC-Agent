(* CODESYS ST。POU：PROGRAM PLC_PRG，实现语言 ST。
   测试工程里若已有 PLC_PRG，用本文件替换其声明与实现，不要再建第二个 PLC_PRG。
   这些 BOOL 是示例变量。物理通道在测试工程的 I/O Mapping 里绑定。
   M1 ↔ MotorRun；S01 ↔ S01_PartDetect。
   不写 %IX / %QX，避免工程设备没有对应通道时编译失败。 *)

PROGRAM PLC_PRG
VAR
    StartPb : BOOL;                  // 启动按钮
    StopPb : BOOL;                   // 停止按钮
    EStopOk : BOOL := TRUE;          // 急停回路，演示初值为正常
    OverloadTrip : BOOL;             // 过载
    RunningFb : BOOL;                // 运行反馈
    ResetPb : BOOL;                  // 故障复位
    S01_PartDetect : BOOL;           // S01 物料检测
    MotorRun : BOOL;                 // M1 运行命令
    FaultLatched : BOOL;             // 故障锁存
    fbConveyor : FB_Conveyor;        // 输送线启停
END_VAR

// ===== 以下为实现部分 =====

// M1 ↔ MotorRun；S01 ↔ S01_PartDetect（S01 接在启动许可输入上）
fbConveyor(
    StartPb := StartPb,
    StopPb := StopPb,
    EStopOk := EStopOk,
    OverloadTrip := OverloadTrip,
    RunningFb := RunningFb,
    ResetPb := ResetPb,
    S01_PartDetect := S01_PartDetect,
    MotorRun => MotorRun,
    FaultLatched => FaultLatched);

END_PROGRAM
