#!/bin/bash

# define usage function
function usage() {
	echo -e "Usage: $(basename $0) \e[2;mLINK|FILE\e[0;m"
}

# check flags number
if [ $# -ne 2 ]; then
	usage
fi

# check flag's type and download videos
if [ -f $1 ]; then
	# for each line, we downloading the video
	while read line; do
        echo $i;
        youtube-dl -i $line;
        # if there is an error during execution, we print the
        # link of the current video into a log file
        if [ $? -ne 0 ]; then
            echo $line >> badnews.log
        fi;
        # we continue execution
        $i = $i + 1;
    done < $1;
else
	# just download the video
	youtube-dl -i $1;
fi
