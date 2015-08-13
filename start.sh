#!/bin/sh

set -e

# http://stackoverflow.com/a/26028597/864236
ln /dev/null /dev/raw1394

if [ -z "$1" ]
then
	echo must specify image URL
	exit 1
fi

curl $1 > /ddd/img_original.jpg
convert /ddd/img_original.jpg -depth 8 -type TrueColor /ddd/img.jpg
#convert /ddd/img_original.jpg -set colorspace RGB /ddd/img.jpg
echo "done downloading image"

ipython /ddd/deepdreams.py $2 $3 $4 $5
# docker run -it --rm -v /tmp:/tmp aquarius212/ffmpeg /bin/bash -c "ffmpeg -f image2 -r 1 -pattern_type glob -i 'images/*.png' -b 600k -pix_fmt yuv420p images/out.mp4"

