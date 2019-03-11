#! /bin/bash

#Script to convert all video files in a given folder, to .mp4 format





#Prompt user whether to delete original files after successful conversion
dec_del=""
while [[ ! $dec_del == [yYnN] ]]; do
    read -p "Do you want original files to be deleted after conversion (y/n)? " dec_del
done


#Convert video to MP4
for filepath in ~/project/src/*.*; do
	name=${filepath##*/};
	echo "Conversion of \"$name\" in progress. This may take serveral minutes...";
	ffmpeg -i "$filepath" -y -c:av copy ~/project/dst/"${name%.*}.mp4" 2>>error.txt;
	if [ $? -eq 0 ]; then
		if dec_delete=[Yy]; then
			rm -f "$filepath"
		fi
		echo "File \"${name%.*}.mp4\" generated successfully"
	else
		echo "Conversion of \"$name\" failed. Consult error.txt for more info"
	fi
done
