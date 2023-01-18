#! usr/bin/bash

# Check if there are 3 parameters
if [ "$#" -ne 3 ]; then
        echo "Error: Enter 3 parameters."
        exit
fi

# Check if first parameter is a valid file path
if ! [ -e $1 ]; then
        echo "File doesn't exist. First parameter has to be a valid file path."
        exit
fi

# Check if values of second and third parameters match
if [[ $2 == $3 ]]; then
        echo "Values of second and third parameter match."
        exit
fi

# Get file name, path and extension
directory_path="${1%/*}"
original_file_name_with_extension="$(basename $1)"
original_file_name="${original_file_name_with_extension%.*}"
extension="${original_file_name_with_extension##*.}"
new_file="$directory_path""/""$original_file_name""_changed.""$extension"

# Replace content old file and put the replaced content in a new file
awk -v OLD=$2 -v NEW=$3 '
    ($0 ~ OLD) {gsub(OLD, NEW); count++}1
    END{print count " substitutions occured."}
' "$1">$new_file

# Print number of changes in terminal
tail -1 $new_file
sed -i '$d' $new_file
