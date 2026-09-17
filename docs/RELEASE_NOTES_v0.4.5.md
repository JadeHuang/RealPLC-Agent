# RealPLC Agent v0.4.5

本版本将默认 RealPLC 云端 WebSocket 地址统一为规范的 `www` 主机名，避免客户端先连接裸域再依赖 HTTP 301 跳转。

## 变更

- 默认地址：`wss://www.realplc.com/api/agent-gateway/agent/ws`
- 产品、程序集、TIA Connector manifest 和安装器元数据统一为 `0.4.5`
- 已有用户配置不被覆盖；新安装或重新生成默认配置时使用新地址

## 下载与校验

- 安装包：`RealPLC_Agent_V0.4.5_Setup_x64.exe`
- 文件大小：146,356,796 字节
- SHA-256：`E0C69AB751575671FF636BC6F0C68731DC9328501FF8DB4D8CB30148208D5EFB`
- 发布状态：正式 GitHub Release（公开测试）
- 数字签名：当前安装包尚未签名

## 已知限制

- 构建机未安装 TIA Portal，TIA Openness 的最终连接仍需在目标 Windows 环境验收。
