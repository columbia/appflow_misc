same=0
interval=$1
count=$2
max=$3

if [ -e /system/xbin/diff ]; then
    DIFF=/system/xbin/diff
else
    DIFF=/data/local/tmp/diff
fi

screencap > /sdcard/snapshot

for i in `seq $max`; do
    screencap > /sdcard/new_snapshot
    $DIFF /sdcard/snapshot /sdcard/new_snapshot
    if [ $? -eq 0 ]; then
        same=`expr $same + 1`
    else
        same=0
    fi

    if [ $same -eq $count ]; then
        echo idled at $i
        exit 0
    fi
    mv /sdcard/new_snapshot /sdcard/snapshot
    sleep $interval
done

echo not idled

exit 1
