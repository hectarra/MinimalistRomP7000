#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 11425792 a1efff9a06cba178d7cdcc298b4d98325cbeeaa1 7819264 c1f87d1a68cde5eb35fdaeefd5798f5e5626e5e8
fi

if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/by-name/recovery:11425792:a1efff9a06cba178d7cdcc298b4d98325cbeeaa1; then
  applypatch  EMMC:/dev/block/platform/mtk-msdc.0/by-name/boot:7819264:c1f87d1a68cde5eb35fdaeefd5798f5e5626e5e8 EMMC:/dev/block/platform/mtk-msdc.0/by-name/recovery a1efff9a06cba178d7cdcc298b4d98325cbeeaa1 11425792 c1f87d1a68cde5eb35fdaeefd5798f5e5626e5e8:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
