#!/bin/bash

# 1枚のスプラッシュから各プラットフォームに合わせたスプラッシュ画像を生成する
#
# requires: imagemagick

function usage()  {
  echo "Usage: rockhand splash <base_image> <titanium_home> -b <background_color> [-h]"
  exit 1
}

# 設定値
background_color="#ffb570"  # 背景色

# Args
while getopts b:h OPT
do
    case $OPT in
        b)  background_color=$OPTARG
            ;;
        h)  usage_exit
            ;;
        \?) usage_exit
            ;;
    esac
done
shift $((OPTIND - 1))

if [ -z "$1" ] || [ ! -f $1 ]; then
    echo "Invalid args: $1"
    usage
fi
if [ -z $2 ] || [ ! -d $2 ]; then
    echo "Invalid args: $2"
    usage
fi

base_image=$1               # 1024x1024 推奨
titanium_home=$2            # Titanium Home

# 画像合成関数
# usage: generate_splash <width> <height> <filename> <depth> 
# generate_splash 640 960 output.png 72
function generate_splash(){
    width=$1
    height=$2
    filename=$3
    depth=$4
    
    echo "generating...  width=$1	height=$2	filename=$3	depth=$4" 
    
    # ベース画像を短辺の50%の大きさにリサイズ
    short=$height
    if [ $width -lt $height ]; then
        short=$width
    fi
    short=$(($short / 2))
    convert -resize ${short}x${short} $base_image base.png
    
    # 背景画像作成
    convert -size ${width}x${height} xc:$background_color background.png
    
    # 重ね合わせ
    convert background.png base.png -gravity center -composite composite.png
    
    # DPI調整
    convert -units PixelsPerInch composite.png -density $depth $filename
    
    # お掃除
    rm -f ./base.png ./background.png ./composite.png
}

# Sample
# generate_splash  1040 320 ./sample.jpg 72
 
# iOS 
generate_splash 320  480  ${titanium_home}/app/assets/iphone/Default.png 72
generate_splash 640  960  ${titanium_home}/app/assets/iphone/Default@2x.png 72
generate_splash 640  960  ${titanium_home}/app/assets/iphone/Default@2x.png 72
generate_splash 640  1136 ${titanium_home}/app/assets/iphone/Default-568h@2x.png 72
generate_splash 750  1334 ${titanium_home}/app/assets/iphone/Default-667h@2x.png 72
generate_splash 2208 1242 ${titanium_home}/app/assets/iphone/Default-Landscape-736h@3x.png 72
generate_splash 1242 2208 ${titanium_home}/app/assets/iphone/Default-Portrait-736h@3x.png 72
generate_splash 1024 768  ${titanium_home}/app/assets/iphone/Default-Landscape.png 72
generate_splash 768  1024 ${titanium_home}/app/assets/iphone/Default-Portrait.png 72
generate_splash 2048 1536 ${titanium_home}/app/assets/iphone/Default-Landscape@2x.png 72
generate_splash 1536 2048 ${titanium_home}/app/assets/iphone/Default-Portrait@2x.png 72
 
 # Android
generate_splash 320 480   ${titanium_home}/app/assets/android/default.png 72
generate_splash 800 480   ${titanium_home}/app/assets/android/images/res-long-land-hdpi/default.png  240
generate_splash 400 240   ${titanium_home}/app/assets/android/images/res-long-land-ldpi/default.png  120
generate_splash 480 800   ${titanium_home}/app/assets/android/images/res-long-port-hdpi/default.png  240
generate_splash 240 400   ${titanium_home}/app/assets/android/images/res-long-port-ldpi/default.png  120
generate_splash 800 480   ${titanium_home}/app/assets/android/images/res-notlong-land-hdpi/default.png  240
generate_splash 320 240   ${titanium_home}/app/assets/android/images/res-notlong-land-ldpi/default.png  120
generate_splash 480 320   ${titanium_home}/app/assets/android/images/res-notlong-land-mdpi/default.png  160
generate_splash 480 800   ${titanium_home}/app/assets/android/images/res-notlong-port-hdpi/default.png  240
generate_splash 240 320   ${titanium_home}/app/assets/android/images/res-notlong-port-ldpi/default.png  120
generate_splash 320 480   ${titanium_home}/app/assets/android/images/res-notlong-port-mdpi/default.png  160
