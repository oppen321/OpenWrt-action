#!/bin/bash

# 配置信息
GITEA_USER="zhao"
GITEA_PASS="${GITEA_PASSWORD}"
CURRENT_TIME=$(date +%s)
VERSION="${RELEASE_VERSION}"

# 克隆 OTA 仓库
git clone "https://$GITEA_USER:$GITEA_PASS@git.kejizero.online/zhao/OTA.git"
cd OTA

# 创建 ota.json
cat > ota.json <<EOF
{
    "netgear,r8500": [
        {
            "build_date": "$CURRENT_TIME",
            "sha256sum": "$(sha256sum ../openwrt/bin/targets/bcm53xx/generic/*-bcm53xx-generic-netgear_r8500-squashfs.chk | awk '{print $1}')",
            "url": "https://github.com/${GITHUB_REPOSITORY}/releases/download/${RELEASE_TAG}/openwrt-${VERSION}-bcm53xx-generic-netgear_r8500-squashfs.chk"
        }
    ],
    "friendlyarm,nanopi-r4s": [
        {
            "build_date": "$CURRENT_TIME",
            "sha256sum": "$(sha256sum ../openwrt/bin/targets/rockchip/armv8/*-r4s-squashfs-sysupgrade.img.gz | awk '{print $1}')",
            "url": "https://github.com/${GITHUB_REPOSITORY}/releases/download/${RELEASE_TAG}/openwrt-${VERSION}-rockchip-armv8-friendlyarm_nanopi-r4s-squashfs-sysupgrade.img.gz"
        }
    ],
    "friendlyarm,nanopi-r5c": [
        {
            "build_date": "$CURRENT_TIME",
            "sha256sum": "$(sha256sum ../openwrt/bin/targets/rockchip/armv8/*-r5c-squashfs-sysupgrade.img.gz | awk '{print $1}')",
            "url": "https://github.com/${GITHUB_REPOSITORY}/releases/download/${RELEASE_TAG}/openwrt-${VERSION}-rockchip-armv8-friendlyarm_nanopi-r5c-squashfs-sysupgrade.img.gz"
        }
    ],
    "friendlyarm,nanopi-r5s": [
        {
            "build_date": "$CURRENT_TIME",
            "sha256sum": "$(sha256sum ../openwrt/bin/targets/rockchip/armv8/*-r5s-squashfs-sysupgrade.img.gz | awk '{print $1}')",
            "url": "https://github.com/${GITHUB_REPOSITORY}/releases/download/${RELEASE_TAG}/openwrt-${VERSION}-rockchip-armv8-friendlyarm_nanopi-r5s-squashfs-sysupgrade.img.gz"
        }
    ],
    "x86_64": [
        {
            "build_date": "$CURRENT_TIME",
            "sha256sum": "$(sha256sum ../openwrt/bin/targets/x86/64/*-generic-squashfs-combined-efi.img.gz | awk '{print $1}')",
            "url": "https://github.com/${GITHUB_REPOSITORY}/releases/download/${RELEASE_TAG}/openwrt-${VERSION}-x86-64-generic-squashfs-combined-efi.img.gz"
        }
    ],
    "armsr,armv8": [
        {
            "build_date": "$CURRENT_TIME",
            "sha256sum": "$(sha256sum ../openwrt/bin/targets/armsr/armv8/*-generic-squashfs-combined-efi.img.gz | awk '{print $1}')",
            "url": "https://github.com/${GITHUB_REPOSITORY}/releases/download/${RELEASE_TAG}/openwrt-${VERSION}-armsr-armv8-generic-squashfs-combined-efi.img.gz"
        }
    ]
}
EOF

# 提交更改
git config --global user.name "GitHub Action"
git config --global user.email "action@github.com"
git add ota.json
git commit -m "Update OTA info for version ${VERSION}"
git push
