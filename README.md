# OpenWrt-Action

## 支持设备

| [NanoPi R4S](https://github.com/oppen321/OpenWrt-Action/releases) | [NanoPi R5S](https://github.com/oppen321/OpenWrt-Action/releases) | [X86_64](https://github.com/oppen321/OpenWrt-Action/releases) | [Netgear R8500](https://github.com/oppen321/OpenWrt-Action/releases) | [ARM64/AArch64](https://github.com/oppen321/OpenWrt-Action/releases) |

## 下载方式

- [通过 GitHub 下载](https://github.com/oppen321/OpenWrt-Action/releases)
- [问题反馈](https://github.com/oppen321/OpenWrt-Action/issues)

## 功能特性

### 基本功能
| 基本 | 状态 | 基本 | 状态 |
|------|------|------|------|
| kmod 内核模块安装 | ✅ | 全锥型 NAT（NFT、BCM 双方案） | ✅ |
| AES 硬件加速 | ✅ | 构建优化（O3） | ✅ |
| GPU 硬件加速 | ✅ | 在线 OTA 升级（squashfs） | ✅ |
| HDMI 终端输出 | ✅ | 固件重置（squashfs） | ✅ |
| BBRv3 拥塞控制 | ✅ | CPU 超频支持 | ✅ |
| KVM 虚拟化支持 | ✅ | Shortcut-FE（支持 UDP 入站） | ✅ |
| LLVM-BPF 支持 | ✅ | LRNG（v57） | ✅ |
| NGINX & CURL HTTP3/QUIC 支持 | ✅ | NAT6 | ✅ |

### 内置插件
| 内置插件 | 状态 | 内置插件 | 状态 |
|----------|------|----------|------|
| PassWall | ✅ | Docker | ✅ |
| HomeProxy | ✅ | TTY 终端 | ✅ |
| FileBrowser | ✅ | NetData 监控 | ✅ |
| qBittorrent | ✅ | DiskMan 磁盘管理 | ✅ |
| MosDNS | ✅ | CPU 性能调节 | ✅ |
| 动态 DNS | ✅ | SQM 列队管理 | ✅ |
| Watchcat | ✅ | nlbw 宽带监控 | ✅ |
| KMS 服务器 | ✅ | Socat | ✅ |
| FRP 客户端 | ✅ | 应用过滤 | ✅ |
| 网络唤醒 | ✅ | 访问控制 | ✅ |
| 网络共享（Samba） | ✅ | UPnP | ✅ |
| 锐捷认证 | ✅ | IP 限速 | ✅ |
| Aria2 | ✅ | WireGuard | ✅ |
| Alist 文件列表 | ✅ | L2TP | ✅ |
| USB 打印服务器 | ✅ | ZeroTier | ✅ |
| 隔空播放（AirConnect） | ✅ | WebDav | ✅ |
| 自定义命令 | ✅ | AirPlay 2 | ✅ |
| 网速测试 | ✅ | NATMap | ✅ |

### 图例说明
- ✅ 可用
- ❌ 不可用
- ⏳ 计划中

## 固件说明

- 默认 IP：10.0.0.1
- 默认用户名：root
- 默认密码：password

## 问题反馈

如果在使用过程中遇到任何问题，欢迎：
1. [提交 Issue](https://github.com/oppen321/OpenWrt-Action/issues)
2. [加入讨论](https://github.com/oppen321/OpenWrt-Action/discussions)

## 开源地址

| 类型 | 地址 |
|------|------|
| 构建脚本 | [https://init2.cooluc.com](https://init2.cooluc.com) |
| 构建脚本（存档） | [https://github.com/sbwml/r4s_build_script](https://github.com/sbwml/r4s_build_script) |
| 构建来源 | [https://github.com/sbwml/builder](https://github.com/sbwml/builder) |

## 特别感谢

<table>
<tr>
<td width="33%" align="center"><a href="https://www.friendlyarm.com">友善电子科技</a></td>
<td width="33%" align="center"><a href="https://github.com/openwrt/openwrt">OpenWrt</a></td>
<td width="33%" align="center"><a href="https://github.com/immortalwrt">ImmortalWrt</a></td>
</tr>
<tr>
<td width="33%" align="center"><a href="https://github.com/jerrykuku">jerrykuku</a></td>
<td width="33%" align="center"><a href="https://github.com/QiuSimons">QiuSimons</a></td>
<td width="33%" align="center"><a href="https://github.com/xiaorouji">xiaorouji</a></td>
</tr>
<tr>
<td width="33%" align="center"><a href="https://github.com/IrineSistiana">IrineSistiana</a></td>
<td width="33%" align="center"><a href="https://github.com/XTLS">XTLS</a></td>
<td width="33%" align="center"><a href="https://github.com/fw876">fw876</a></td>
</tr>
</table>
|:---------------------------------:|:------------------------:|:-----------------------------:|
| [IrineSistiana](https://github.com/IrineSistiana) | [XTLS](https://github.com/XTLS) | [fw876](https://github.com/fw876) |
