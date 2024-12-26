#!/bin/bash

# 修改名称
sed -i 's/OpenWrt/ZeroWrt/' package/base-files/files/bin/config_generate

# 更换AD核心
rm -rf feeds/packages/net/adguardhome
git clone https://git.kejizero.online/zhao/adguardhome.git package/new/adguardhome

# ZeroWrt选项菜单
mkdir -p files/bin
# cp -f $GITHUB_WORKSPACE/Diy/ZeroWrt files/bin/ZeroWrt
curl -L -o files/bin/ZeroWrt https://git.kejizero.online/zhao/files/raw/branch/main/bin/ZeroWrt
chmod +x files/bin/ZeroWrt
mkdir -p files/root
curl -L -o files/root/version.txt https://git.kejizero.online/zhao/files/raw/branch/main/bin/version.txt
chmod +x files/root/version.txt

