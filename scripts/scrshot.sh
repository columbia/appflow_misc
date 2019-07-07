#!/bin/sh

#serial=$1
raw=$1
rgba=$2
path=$3

#adb -s $serial shell screencap /sdcard/scr.raw
#adb -s $serial shell gzip /sdcard/scr.raw
#adb -s $serial pull /sdcard/scr.raw $path.raw
#gunzip $path.raw.gz
tail -c +13 $raw > $rgba
convert -size 1080x1920 -depth 8 $rgba $path
rm $raw
rm $rgba
