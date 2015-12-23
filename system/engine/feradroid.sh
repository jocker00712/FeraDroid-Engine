#!/system/bin/sh
### FeraDroid Engine v0.19 | By FeraVolt. 2016 ###

B=/system/engine/bin/busybox
SH=/system/engine/bin/sh
LOG=/sdcard/Android/FDE.txt
TIME=$($B date | $B awk '{ print $4 }')

mount -o remount,rw /system
chmod -R 777 /system/engine/bin/*
setprop ro.feralab.engine 19
$B rm -f $LOG
$B touch $LOG
$B echo "### FeraLab ###" > $LOG
$B echo "" >> $LOG
$B echo "[$TIME] FeraDroid Engine v0.19" >> $LOG
$B echo "[$TIME] Firing up.." >> $LOG
$B echo "[$TIME] Device: $(getprop ro.product.brand) $(getprop ro.product.model)" >> $LOG
$B echo "[$TIME] Android version: $(getprop ro.build.version.release)" >> $LOG
$B echo "[$TIME] ROM version: $(getprop ro.build.display.id)" >> $LOG

if [ -e /system/engine/prop/firstboot ]; then
 $B echo "[$TIME] First boot after deploy" >> $LOG
 mount -o remount,rw /system
 $B echo "[$TIME] Setting permissions.. Installing Busybox.." >> $LOG
 chmod 777 /system/engine
 chmod -R 777 /system/engine/*
 chmod -R 777 /system/engine/assets/*
 chmod -R 777 /system/engine/bin/*
 chmod -R 777 /system/engine/gears/*
 chmod -R 777 /system/engine/prop/*
 $B chmod 644 /system/build.prop
 $B rm -f /system/engine/prop/firstboot
 $B --install -s /system/xbin
fi;
$B echo "[$TIME] Remmounting /data and /system - RW" >> $LOG
$B mount -o remount,rw /system
$B mount -o remount,rw /data
if [ -e /sbin/sysrw ]; then
 $B echo "[$TIME] Remapped partition mount detected" >> $LOG
 /sbin/sysrw
 $B sleep 1
fi;
$B echo "[$TIME] Correcting permissions.." >> $LOG
$B chmod 644 /system/build.prop
$B chmod 777 /system/engine
$B chmod 777 /cache
$B chmod -R 777 /cache/*
$B chmod -R 777 /system/engine/*
$B chmod -R 777 /system/engine/assets/*
$B chmod -R 777 /system/engine/gears/*
$B chmod -R 777 /system/engine/prop/*
$B rm -f /system/etc/sysctl.conf
$B touch /system/etc/sysctl.conf
$B chmod 777 /system/etc/sysctl.conf
$B echo "[$TIME] SYNC. Remount - RW." >> $LOG
sync;
$B mount -o remount,rw /system
$B echo "[$TIME] Running 001 gear.." >> $LOG
$SH /system/engine/gears/001abc.sh
$B echo "[$TIME] Running 002 gear.." >> $LOG
$SH /system/engine/gears/002def.sh
$B echo "[$TIME] Running 003 gear.." >> $LOG
$SH /system/engine/gears/003ghi.sh
$B echo "[$TIME] Running 004 gear.." >> $LOG
$SH /system/engine/gears/004jkl.sh
$B echo "[$TIME] Running 005 gear.." >> $LOG
$SH /system/engine/gears/005mno.sh
$B echo "[$TIME] Running 006 gear.." >> $LOG
$SH /system/engine/gears/006pqr.sh
$B echo "[$TIME] Running 007 gear.." >> $LOG
$SH /system/engine/gears/007stu.sh
$B echo "[$TIME] Running 008 gear.." >> $LOG
$SH /system/engine/gears/008vwx.sh
$B echo "[$TIME] Remmounting /data and /system - RO" >> $LOG
$B mount -o remount,ro /system
$B echo "[$TIME] Applying kernel configuration.." >> $LOG
sysctl -p /system/etc/sysctl.conf
$B echo "[$TIME] Sleep, sync and free RAM" >> $LOG
$B sleep 1
sync;
$B sleep 1
$B echo 3 > /proc/sys/vm/drop_caches
$B sleep 1
sync;
$B sleep 1
$B echo 2 > /proc/sys/vm/drop_caches
$B sleep 1
sync;
$B sleep 1
$B echo 1 > /proc/sys/vm/drop_caches
$B sleep 1
sync;
$B sleep 1
$B echo 3 > /proc/sys/vm/drop_caches
$B sleep 3
sync;
$B echo "[$TIME] FDE status - OK" >> $LOG
$B echo "" >> $LOG

