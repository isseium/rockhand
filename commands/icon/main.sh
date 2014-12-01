#!/bin/sh

# 1枚のアイコンから各プラットフォームに合わせたアイコンを作成する
#
# requires: imagemagick

function usage()  {
  echo "Usage: rockhand icon <base_image> <titanium_home> [-h]"
  exit 1
}

if [ -z "$1" ] || [ ! -f "$1" ]; then
    echo "Invalid args: $1"
    usage
fi
if [ -z $2 ] || [ ! -d $2 ]; then
    echo "Invalid args: $2"
    usage
fi

base_image=$1
titanium_home=$2

# Args
while getopts h OPT
do
    case $OPT in
        h)  usage_exit
            ;;
        \?) usage_exit
            ;;
    esac
done
shift $((OPTIND - 1))

# usage: convert_icon <width> <height> <filename>
function convert_icon(){
    width=$1
    height=$2
    base=$3
    filename=$4
    
    echo "generating...  width=$1 	height=$2	filename=$4" 
    
    convert -resize ${width}x${height} $base $filename 2> /dev/null
}

# iOS 対応
convert_icon 120 120 $base_image $titanium_home/app/assets/iphone/appicon-60@2x.png
convert_icon  76  76 $base_image $titanium_home/app/assets/iphone/appicon-76.png
convert_icon 152 152 $base_image $titanium_home/app/assets/iphone/appicon-76@2x.png
convert_icon  57  57 $base_image $titanium_home/app/assets/iphone/appicon.png
convert_icon 114 114 $base_image $titanium_home/app/assets/iphone/appicon@2x.png
convert_icon  72  72 $base_image $titanium_home/app/assets/iphone/appicon-72.png
convert_icon 144 144 $base_image $titanium_home/app/assets/iphone/appicon-72@2x.png
convert_icon  40  40 $base_image $titanium_home/app/assets/iphone/appicon-Small-40.png
convert_icon  80  80 $base_image $titanium_home/app/assets/iphone/appicon-Small-40@2x.png
convert_icon  29  29 $base_image $titanium_home/app/assets/iphone/appicon-Small.png
convert_icon  58  58 $base_image $titanium_home/app/assets/iphone/appicon-Small@2x.png
convert_icon  50  50 $base_image $titanium_home/app/assets/iphone/appicon-Small-50.png
convert_icon 100 100 $base_image $titanium_home/app/assets/iphone/appicon-Small-50@2x.png
convert_icon  58  58 $base_image $titanium_home/app/assets/iphone/appicon-Small@2x.png
convert_icon 512 512 $base_image $titanium_home/app/assets/iphone/iTunesArtwork
convert_icon 512 512 $base_image $titanium_home/iTunesConnect.png

# Android 対応
convert_icon 512 512 $base_image $titanium_home/app/assets/android/MarketplaceArtwork.png       # old
convert_icon 512 512 $base_image $titanium_home/MarketplaceArtwork.png
convert_icon 128 128 $base_image $titanium_home/app/assets/android/appicon.png

mkdir -p ${titanium_home}/platform/android/res/drawable-ldpi/ ${titanium_home}/platform/android/res/drawable-mdpi/ ${titanium_home}/platform/android/res/drawable-hdpi/ ${titanium_home}/platform/android/res/drawable-xhdpi/ ${titanium_home}/platform/android/res/drawable-xxhdpi 

convert_icon  36  36 $base_image ${titanium_home}/platform/android/res/drawable-ldpi/appicon.png
convert_icon  48  48 $base_image ${titanium_home}/platform/android/res/drawable-mdpi/appicon.png
convert_icon  72  72 $base_image ${titanium_home}/platform/android/res/drawable-hdpi/appicon.png
convert_icon  96  96 $base_image ${titanium_home}/platform/android/res/drawable-xhdpi/appicon.png
convert_icon 144 144 $base_image ${titanium_home}/platform/android/res/drawable-xxhdpi/appicon.png
