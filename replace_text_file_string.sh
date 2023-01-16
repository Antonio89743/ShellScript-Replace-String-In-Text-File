#! usr/bin/bash

# Check if there are 3 parameters
if [ "$#" -ne 3 ]; then
        echo "Error: Send 3 parameters."
        exit
fi

# Check if first parameter is a valid file path
if ! [ -e $1 ]; then
        echo "File doesn't exist. First parameter has to be a valid file path."
        exit
fi

## should you check if file access modifier let's you copy from old file?
## should you check if file changed already exists

# Create empty -changed file
directory_path="${1%/*}"
original_file_name_with_extension="$(basename $1)"
original_file_name="${original_file_name_with_extension%.*}"
extension="${original_file_name_with_extension##*.}"
new_file="$directory_path""/""$original_file_name""_changed.""$extension"
>$new_file

## get text from old file
## replace args
## place the result in the _changed file 

## you could just place func to replace string before >$new_file, so you can create and fill that new_file in one line
