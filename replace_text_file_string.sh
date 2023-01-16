#! usr/bin/bash

# Check if there are 3 parameters

if [ "$#" -ne 3 ]; then
        echo "Error: Send 3 parameters."
        exit
fi

# check if first parameter is a valid file path

if ! [ -e $1 ]; then
        echo "File doesn't exist. First parameter has to be a valid file path."
        exit
fi

## should you check if file access modifier let's you copy?


directory_path="${1%/*}"
original_file_name_with_extension="$(basename $1)"
original_file_name="${original_file_name_with_extension%.*}"
new_file_name="$original_file_name""_changed.txt"
echo $original_file_name
echo $directory_path
echo $new_file_name

