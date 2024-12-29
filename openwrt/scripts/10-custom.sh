#!/bin/bash

# 修改名称
sed -i 's/OpenWrt/ZeroWrt/' package/base-files/files/bin/config_generate

# ZeroWrt选项菜单
mkdir -p files/bin
# cp -f $GITHUB_WORKSPACE/Diy/ZeroWrt files/bin/ZeroWrt
curl -L -o files/bin/ZeroWrt https://git.kejizero.online/zhao/files/raw/branch/main/bin/ZeroWrt
chmod +x files/bin/ZeroWrt
mkdir -p files/root
curl -L -o files/root/version.txt https://git.kejizero.online/zhao/files/raw/branch/main/bin/version.txt
chmod +x files/root/version.txt

# 更换背景
curl -L -o package/new/luci-theme-argon/luci-theme-argon/htdocs/luci-static/argon/img/bg.webp https://git.kejizero.online/zhao/files/raw/branch/main/%20background/bg.webp

# 自定义配置
curl -L -o package/base-files/files/etc/banner https://git.kejizero.online/zhao/files/raw/branch/main/etc/banner

# Git稀疏克隆，只克隆指定目录到本地
function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package
  cd .. && rm -rf $repodir
}

# iStore
git_sparse_clone main https://github.com/linkease/istore-ui app-store-ui
git_sparse_clone main https://github.com/linkease/istore luci

# 函数：根据设备类型确定架构
get_arch() {
    case "$1" in
        "x86_64")
            echo "amd64"
            ;;
        "armv8"|"nanopi-r4s"|"nanopi-r5s")
            echo "arm64"
            ;;
        "netgear_r8500")
            echo "armv7"
            ;;
        *)
            echo "未知设备类型: $1" >&2
            exit 1
            ;;
    esac
}

# 获取设备架构
ARCH=$(get_arch "$1")

# 创建核心目录
mkdir -p files/etc/openclash/core

# 下载对应架构的核心
CLASH_DEV_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/dev/clash-linux-${ARCH}.tar.gz"
CLASH_TUN_URL=$(curl -fsSL https://api.github.com/repos/vernesong/OpenClash/contents/master/premium\?ref\=core | grep download_url | grep ${ARCH} | awk -F '"' '{print $4}' | grep -v 'v3')
CLASH_META_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-${ARCH}.tar.gz"
GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"

# 下载核心文件
echo "正在下载 ${ARCH} 架构的核心文件..."
wget -qO- $CLASH_DEV_URL | tar xOvz > files/etc/openclash/core/clash
wget -qO- $CLASH_TUN_URL | gunzip -c > files/etc/openclash/core/clash_tun
wget -qO- $CLASH_META_URL | tar xOvz > files/etc/openclash/core/clash_meta
wget -qO- $GEOIP_URL > files/etc/openclash/GeoIP.dat
wget -qO- $GEOSITE_URL > files/etc/openclash/GeoSite.dat

# 设置执行权限
chmod +x files/etc/openclash/core/clash*

echo "核心文件下载完成！"
