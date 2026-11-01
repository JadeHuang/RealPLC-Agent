(* CODESYS ST。POU：FUNCTION_BLOCK FB_Conveyor，实现语言 ST。
   声明编辑器粘贴 FUNCTION_BLOCK 到最后一个 END_VAR。
   实现编辑器只粘贴可执行语句，不含 END_FUNCTION_BLOCK。
   现场 I/O 以同目录 REQUIREMENT.md 为唯一契约。
   M1 ↔ MotorRun；S01 ↔ S01_PartDetect。 *)

FUNCTION_BLOCK FB_Conveyor
VAR_INPUT
    StartPb : BOOL;            // 启动按钮
    StopPb : BOOL;             // 停止按钮，电平有效
    EStopOk : BOOL;            // TRUE=急停回路正常；FALSE=急停
    OverloadTrip : BOOL;       // 过载动作
    RunningFb : BOOL;          // 电机运行反馈
    ResetPb : BOOL;            // 故障复位按钮
    S01_PartDetect : BOOL;     // S01 物料检测，启动运行许可
END_VAR
VAR_OUTPUT
    MotorRun : BOOL;           // M1 运行命令
    FaultLatched : BOOL;       // 故障锁存，复位前保持
END_VAR
VAR
    FbTimeout : TIME := T#3S; // 反馈超时，建议 3 秒；改初值即可配置
    tonRunningFb : TON;        // 运行命令已发、反馈未到
    rTrigStart : R_TRIG;
    rTrigStop : R_TRIG;
    rTrigReset : R_TRIG;
    cmdRun : BOOL;             // 运行记忆。复位只清故障锁存，不会把本记忆置 TRUE
END_VAR

// ===== 以下为实现部分 =====

// 按钮只认上升沿，避免按住启动或复位时每个周期重复触发。
rTrigStart(CLK := StartPb);
rTrigStop(CLK := StopPb);
rTrigReset(CLK := ResetPb);

// 启动许可：无故障、无过载、急停正常、未按停止，且 S01 检测到物料。
IF rTrigStart.Q
    AND (NOT FaultLatched)
    AND (NOT OverloadTrip)
    AND EStopOk
    AND (NOT StopPb)
    AND S01_PartDetect THEN
    cmdRun := TRUE;
END_IF

// 停止沿与停止/急停电平都立即撤销运行命令。松开后不恢复 cmdRun。
IF rTrigStop.Q OR StopPb OR (NOT EStopOk) THEN
    cmdRun := FALSE;
END_IF

// 已要求运行但 RunningFb 仍为 FALSE 时计时。
tonRunningFb(IN := cmdRun AND (NOT RunningFb), PT := FbTimeout);

// 过载或反馈超时：锁存故障，并清运行记忆，防止复位后自动重启。
IF OverloadTrip OR tonRunningFb.Q THEN
    FaultLatched := TRUE;
    cmdRun := FALSE;
END_IF

// 故障原因消失且急停已恢复时，复位沿只清除锁存。
IF rTrigReset.Q
    AND (NOT OverloadTrip)
    AND (NOT tonRunningFb.Q)
    AND EStopOk THEN
    FaultLatched := FALSE;
END_IF

// 输出侧再次联锁，同一周期内停止、急停、过载和锁存都能撤掉 M1。
MotorRun := cmdRun
    AND EStopOk
    AND (NOT StopPb)
    AND (NOT OverloadTrip)
    AND (NOT FaultLatched);

END_FUNCTION_BLOCK
