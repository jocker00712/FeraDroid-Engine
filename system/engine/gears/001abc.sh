#!/system/bin/sh
### FeraDroid Engine v0.19 | By FeraVolt. 2016 ###

B=/system/engine/bin/busybox
LOG=/sdcard/Android/FDE.txt
TIME=$($B date | $B awk '{ print $4 }')

$B echo "[$TIME] 001 - ***Cleaning gear***" >> $LOG
$B echo "" >> $LOG
$B echo " Remmounting /data and /system - RW" >> $LOG
$B mount -o remount,rw /system
$B mount -o remount,rw /data
$B echo " Cleaning trash.." >> $LOG
$B rm -f /cache/*.apk
$B rm -f /cache/*.tmp
$B rm -f /cache/recovery/*.tmp
$B rm -f /data/*.log
$B rm -Rf /data/anr/*
$B rm -f /data/cache/*
$B rm -Rf /data/local/tmp/*
$B rm -f /data/local/*.apk
$B rm -f /data/local/*.log
$B rm -f /data/tombstones/*
$B rm -Rf /data/system/dropbox/*
$B rm -Rf /data/system/usagestats/*
$B rm -f /data/dalvik-cache/*.apk
$B rm -f /data/dalvik-cache/*.tmp
$B chmod 000 /data/tombstones
$B rm -Rf /system/lost+found/*
$B rm -Rf /mnt/sdcard/LOST.DIR/*
$B rm -Rf /mnt/sdcard/found000/*
$B rm -Rf /mnt/sdcard/LazyList/*
$B rm -Rf /mnt/sdcard/cleanmaster/*
$B rm -Rf /mnt/sdcard/albumthumbs/*
$B rm -Rf /mnt/sdcard/kunlun/*
$B rm -Rf /mnt/sdcard/.antutu/*
$B rm -Rf /mnt/sdcard/.estrongs/*
$B rm -Rf /mnt/sdcard/.kate/*
$B rm -Rf /mnt/sdcard/baidu/*
$B rm -Rf /mnt/sdcard/DCIM/.thumbnails/*
$B rm -f /mnt/sdcard/fix_permissions.log
$B sleep 1
$B echo "" >> $LOG
$B echo "[$TIME] 001 - ***Cleaning gear*** - OK" >> $LOG
sync;

