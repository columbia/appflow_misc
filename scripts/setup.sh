serial=$1

if [ "$serial" = "" ]; then
    echo "usage: setup.sh <serial>"
    exit 1
fi

adb -s $serial push lib/uiauto.jar /sdcard/
adb -s $serial push scripts/idle.sh /sdcard/
adb -s $serial push lib/busybox /data/local/tmp
adb -s $serial shell chmod 0777 /data/local/tmp/busybox
adb -s $serial shell ln -fs busybox /data/local/tmp/diff
adb -s $serial install lib/webview.apk
adb -s $serial install lib/gms.apk
