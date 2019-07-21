#!/bin/sh
### FDE.AI v4 | FeraVolt. 2019 ###
. /fde.ai/s/libfde.so;
$B rm -Rf /cache/*.apk;if [ -n "$RUS" ];then flog "- Очищен от мусора раздел cache";else flog "- Cache partition trash cleaned";fi;$B rm -f /data/*.log;$B rm -f /data/*.txt;$B rm -f /data/anr/*;$B rm -f /data/backup/pending/*.tmp;$B rm -f /data/cache/*.*;$B rm -f /data/data/*.log;$B rm -f /data/data/*.txt;$B rm -f /data/log/*.log;$B rm -f /data/log/*.txt;$B rm -f /data/local/*.apk;$B rm -f /data/local/*.log;$B rm -f /data/local/*.txt;$B rm -f /data/local/tmp/*;$B rm -f /data/last_alog/*.log;$B rm -f /data/last_alog/*.txt;$B rm -f /data/last_kmsg/*.log;$B rm -f /data/last_kmsg/*.txt;$B rm -f /data/mlog/*;$B rm -f /data/system/*.log;$B rm -f /data/system/*.txt;$B rm -f /data/system/dropbox/*;$B rm -Rf /data/system/usagestats/*;$B rm -f /data/system/shared_prefs/*;$B rm -f /data/tombstones/*;if [ -n "$RUS" ];then flog "- Очищен от мусора пользовательский раздел";else flog "- User partition trash cleaned";fi;$B rm -Rf /sdcard/LOST.DIR;$B rm -Rf /sdcard/found000;$B rm -Rf /sdcard/LazyList;$B rm -Rf /sdcard/albumthumbs;$B rm -Rf /sdcard/kunlun;$B rm -Rf /sdcard/.CacheOfEUI;$B rm -Rf /sdcard/.bstats;$B rm -Rf /sdcard/.taobao;$B rm -Rf /sdcard/Backucup;$B rm -Rf /sdcard/MIUI/debug_log;$B rm -Rf /sdcard/wlan_logs;$B rm -Rf /sdcard/ramdump;$B rm -Rf /sdcard/UnityAdsVideoCache;$B rm -f /sdcard/*.log;$B rm -f /sdcard/*.CHK;if [ -n "$RUS" ];then flog "- Очищена от мусора встроенная память";else flog "- Internal memory trash cleaned";fi;PP=$($B df -P|$B grep /data|$B head -n 1|$B awk '{ print $5 }'|$B sed 's/%//g');if [ "$PP" -le "100" ];then if [ "$PP" -ge "80" ];then if [ -n "$RUS" ];then flog "- Память заполнена на $PP % - очищаю кэш приложений..";else flog "- $PP % of storage is used - clearing apps cache..";fi;pm trim-caches 16g;fi;fi;exit;
