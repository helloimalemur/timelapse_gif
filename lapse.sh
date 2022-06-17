#!/bin/bash

DAY=$(date +%d)
MONTH=$(date +%m)
YESTERDAY=$(expr $DAY - 1)

#variable 1 day
if [ -z "$1" ]; then
	echo "Input empty, creating GIF for today...."
	WHEN="$MONTH-$DAY"
else
	WHEN="$1"
fi

#variable 2 speed or delay
if [ -z "$2" ]; then
        SPEED=30
else
        SPEED=$2
fi

DAYBF=$(expr $(echo $WHEN | cut -c 4-5) - 1)
REF="$MONTH-$DAYBF"


#setup
mkdir ~/timelapse 2>/dev/null
mkdir ~/timelapse/gifs 2>/dev/null
rm /tmp/list.txt 2>/dev/null

###debug
#echo $DAY "day"
#echo $MONTH "month"
#echo $YESTERDAY "yesterday"
#echo $WHEN "when"
#echo $REF "ref"
#echo $DAYBF "daybf"

###file-list
cd ~/timelapse

##remove blanks
find . -maxdepth 1 -name "*.jpg" -size -1700k -type f -exec rm {} \;

#create file list
find . -maxdepth 1 -size +1M -type f | grep "$WHEN-2022" | uniq | sort >> /tmp/list.txt

#execute
cat /tmp/list.txt
cd ~/timelapse
#echo "Creating GIF of $(wc -l /tmp/list.txt | cut -c 1-3) images from $WHEN with delay of $SPEED""ms ..."
MESSAGE=$(echo "Creating GIF from $(wc -l /tmp/list.txt | cut -c 1-3) images of $WHEN with delay of $SPEED""ms ...")
echo $MESSAGE
convert -delay $SPEED -resize 50% -loop 0 `cat /tmp/list.txt` ~/timelapse/gifs/$SPEED-gif_$WHEN.gif

#cleanup
rm /tmp/list.txt 2>/dev/null
echo "done!"

