# RealPLC Agent v0.4.3

v0.4.3 集中解决 TIA Portal V21+ Openness 入口变化、多版本选择、CODESYS Scripting 配置和 Windows 界面体验问题。

## 主要更新

- 同时识别传统 `Siemens.Engineering.dll` 和 TIA V21+ `Siemens.Engineering.Base.dll` 模块化 PublicAPI。
- 首次使用自动选择已发现的最高 TIA/CODESYS 版本；用户手动选择后保持固定。
- CODESYS Scripting 缺失或损坏时，可从配置窗口启动安装/修复。
- 调整按钮、下拉框、状态栏和说明区域，改善高 DPI 与小屏幕显示。
- 精简重复菜单、工作区信息和无实际用途的入口。
- 使用原生文档查看器即时显示说明，并可交给系统浏览器打开本地 HTML。
- 移除 WebView2 的编译、运行和安装依赖。
- 首次运行默认连接 RealPLC 正式云端，同时保留升级用户已有配置。

## 下载

- Windows x64：`RealPLC_Agent_V0.4.3_Setup_x64.exe`
- SHA-256：`0092FF0EE1915AB3BDF6311D512CD2D31D92087F17F1E49D0E5F48C874C56DD3`

## 验证结果

- CODESYS：97 项测试通过，类型检查通过。
- TIA 离线验证：48/48 通过。
- SimaticML：53/53 通过。
- UI 自动回归通过，包含 150% 缩放场景。
- 自动更新元数据、完整安装包下载和 SHA-256 校验通过。

## 已知限制

- 本版本安装包尚未进行代码签名。
- TIA V21+ 真实 Openness 连接需要在安装对应 TIA Portal 版本的电脑上完成最终验收。
