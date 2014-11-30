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


# iOS 対応
convert -resize 120x120 $base_image $titanium_home/app/assets/iphone/appicon-60@2x.png
convert -resize 76x76   $base_image $titanium_home/app/assets/iphone/appicon-76.png
convert -resize 152x152 $base_image $titanium_home/app/assets/iphone/appicon-76@2x.png
convert -resize 57x57   $base_image $titanium_home/app/assets/iphone/appicon.png
convert -resize 114x114 $base_image $titanium_home/app/assets/iphone/appicon@2x.png
convert -resize 72x72   $base_image $titanium_home/app/assets/iphone/appicon-72.png
convert -resize 144x144 $base_image $titanium_home/app/assets/iphone/appicon-72@2x.png
convert -resize 40x40   $base_image $titanium_home/app/assets/iphone/appicon-Small-40.png
convert -resize 80x80   $base_image $titanium_home/app/assets/iphone/appicon-Small-40@2x.png
convert -resize 29x29   $base_image $titanium_home/app/assets/iphone/appicon-Small.png
convert -resize 58x58   $base_image $titanium_home/app/assets/iphone/appicon-Small@2x.png
convert -resize 50x50   $base_image $titanium_home/app/assets/iphone/appicon-Small-50.png
convert -resize 100x100 $base_image $titanium_home/app/assets/iphone/appicon-Small-50@2x.png
convert -resize 58x58   $base_image $titanium_home/app/assets/iphone/appicon-Small@2x.png
convert -resize 512x512 $base_image $titanium_home/app/assets/iphone/iTunesArtwork

# Android 対応
convert -resize 512x512 $base_image $titanium_home/app/assets/android/MarketplaceArtwork.png
convert -resize 128x128 $base_image $titanium_home/app/assets/android/appicon.png

mkdir -p ${titanium_home}/platform/android/res/drawable-ldpi/ ${titanium_home}/platform/android/res/drawable-mdpi/ ${titanium_home}/platform/android/res/drawable-hdpi/ ${titanium_home}/platform/android/res/drawable-xhdpi/ ${titanium_home}/platform/android/res/drawable-xxhdpi 

convert -resize 36x36   $base_image ${titanium_home}/platform/android/res/drawable-ldpi/appicon.png
convert -resize 48x48   $base_image ${titanium_home}/platform/android/res/drawable-mdpi/appicon.png
convert -resize 72x72   $base_image ${titanium_home}/platform/android/res/drawable-hdpi/appicon.png
convert -resize 96x96   $base_image ${titanium_home}/platform/android/res/drawable-xhdpi/appicon.png
convert -resize 144x144 $base_image ${titanium_home}/platform/android/res/drawable-xxhdpi/appicon.png
