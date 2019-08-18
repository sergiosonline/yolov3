#!/bin/bash
# https://stackoverflow.com/questions/48133080/how-to-download-a-google-drive-url-via-curl-or-wget/48133859

# Zip coco folder
# zip -r coco.zip coco
# tar -czvf coco.tar.gz coco

# Set fileid and filename
filename="drone-vs-plane.zip"
fileid="1PDLwXfC4-cb45aYvlGr3orHSlbqXxAr2"  # drone-vs-plane.zip

# Download from Google Drive, accepting presented query
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm ./cookie

# Unzip
unzip -q ${filename}  # for drone-vs-plane.zip
# tar -xzf ${filename}  # for drone-vs-plane.tar.gz
