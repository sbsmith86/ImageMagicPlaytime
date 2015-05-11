#!/bin/bash

echo "Drawing image..."

TEMP_FILE_1=tmp1.png
TEMP_FILE_2=tmp2.png
FINAL_FILE=test_image.jpeg

while read line; do
  convert \
    -size 471x248 \
    canvas:#23B7FB \
    -fill "#337D9F" \
    -pointsize 16 \
    -font ProximaNova-Bold.otf \
    -annotate +20+40 'make a difference' \
    $TEMP_FILE_1

  convert \
    -background transparent \
    -size 431x228 \
    -fill white \
    -font ProximaNova-Reg.otf \
    -pointsize 24 \
    caption:"$line" \
    $TEMP_FILE_2 \

  composite \
    $TEMP_FILE_2 \
    -gravity northwest \
    -geometry +20+50 \
    $TEMP_FILE_1 \
    $FINAL_FILE

  rm $TEMP_FILE_1
  rm $TEMP_FILE_2

done <sample.txt
