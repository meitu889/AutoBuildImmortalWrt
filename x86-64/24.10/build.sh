#!/bin/bash

echo "编译固件大小为: $PROFILE MB"

# 输出调试信息
echo "$(date '+%Y-%m-%d %H:%M:%S') - 开始编译..."



# 定义所需安装的包列表
PACKAGES=""
PACKAGES="$PACKAGES curl"
PACKAGES="$PACKAGES luci-i18n-diskman-zh-cn"
PACKAGES="$PACKAGES luci-i18n-firewall-zh-cn"
PACKAGES="$PACKAGES luci-i18n-filebrowser-zh-cn"
PACKAGES="$PACKAGES luci-app-argon-config"
PACKAGES="$PACKAGES luci-i18n-argon-config-zh-cn"
#24.10
PACKAGES="$PACKAGES luci-i18n-package-manager-zh-cn"
PACKAGES="$PACKAGES luci-i18n-ttyd-zh-cn"
PACKAGES="$PACKAGES luci-i18n-passwall-zh-cn"
PACKAGES="$PACKAGES luci-app-openclash"
PACKAGES="$PACKAGES luci-i18n-homeproxy-zh-cn"
PACKAGES="$PACKAGES openssh-sftp-server"
PACKAGES="$PACKAGES luci-i18n-dockerman-zh-cn"
#20250101增加的24.10的软件
PACKAGES="$PACKAGES luci-app-netdata_1.0-r1_all.ipk"
PACKAGES="$PACKAGES luci-i18n-netdata-zh-cn_24.362.20051~34c1f40_all.ipk"
PACKAGES="$PACKAGES luci-app-mwan3_24.362.20051~34c1f40_all.ipk"
PACKAGES="$PACKAGES luci-i18n-mwan3-zh-cn_24.362.20051~34c1f40_all.ipk"
PACKAGES="$PACKAGES luci-app-zerotier_24.362.20051~34c1f40_all.ipk"
PACKAGES="$PACKAGES luci-i18n-zerotier-zh-cn_24.362.20051~34c1f40_all.ipk"
PACKAGES="$PACKAGES luci-app-samba4_24.362.20051~34c1f40_all.ipk"
PACKAGES="$PACKAGES luci-i18n-samba4-zh-cn_24.362.20051~34c1f40_all.ipk"
PACKAGES="$PACKAGES luci-app-upnp_24.362.20051~34c1f40_all.ipk"
PACKAGES="$PACKAGES luci-i18n-upnp-zh-cn_24.362.20051~34c1f40_all.ipk"
PACKAGES="$PACKAGES luci-app-appfilter_5.0.2-r1_all.ipk"
PACKAGES="$PACKAGES luci-i18n-appfilter-zh-cn_24.362.20051~34c1f40_all.ipk"

# 构建镜像
echo "$(date '+%Y-%m-%d %H:%M:%S') - Building image with the following packages:"
echo "$PACKAGES"

make image PROFILE="generic" PACKAGES="$PACKAGES" FILES="/home/build/immortalwrt/files" ROOTFS_PARTSIZE=$PROFILE

if [ $? -ne 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Error: Build failed!"
    exit 1
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') - Build completed successfully."
