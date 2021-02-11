#!/bin/bash
NAME=$1
START=$2
# If duration is unset, use the full length of the video
if [[ $3 ]]; then
    END=$3
else
    END=$(ffprobe -loglevel error -show_streams $NAME | grep duration\= | cut -f2 -d=)
fi
END=$(echo -n $END | cut -d ' ' -f 1)
echo $END
echo "Making a gif of $NAME from $START seconds to $END seconds"

ffmpeg -y -ss $START -t $END -i $NAME -vf fps=24,scale=640:-1:flags=lanczos,palettegen temp_palette.png
ffmpeg -i $NAME -i temp_palette.png -ss $START -t $END -pix_fmt rgb24 -filter_complex "fps=12,scale=640:-1:flags=lanczos[x];[x][1:v]paletteuse" $NAME.gif
rm temp_palette.png
