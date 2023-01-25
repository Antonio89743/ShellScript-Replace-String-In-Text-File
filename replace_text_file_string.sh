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

# Check if third parameter features * 
if [[ $3 =~ .*\*.* ]]; then 
	echo "Third parameter cannot contain *." 
	exit 
fi 

# Get file name, path and extension 
directory_path="${1%/*}" 
original_file_name_with_extension="$(basename $1)" 
original_file_name="${original_file_name_with_extension%.*}" 
extension="${original_file_name_with_extension##*.}" 
string_to_replace=$2 
close_match=false 

# Check if path to file contains a folder 
if [[ $1 == *\/* ]] || [[ $1 == *\\* ]]; then 
        new_file="$directory_path""/""$original_file_name""_changed.""$extension" 
else 
        new_file="$original_file_name""_changed.""$extension" 
fi 

# If second parameter features an asterisk 
# If the asterisk is the last character of second parameter 
# Remove the asterisk, so it won't get left behind after replacing 
# For replace function, do close match rather than indentical match 
if [[ $2 =~ .*\*.* ]]; then 
        if [[ ${2: -1} == "*" ]]; then 
                string_to_replace=${2::-1} 
                close_match=true 
        fi 
fi 

# Copy content of old file in _changed file and replace old value with new value 
if [ "$close_match" = true ]; then 
        awk -v OLD=$string_to_replace -v NEW=$3 ' 
            ($0 = OLD) {gsub(OLD, NEW); count++}1 
            END{print count " substitutions occured."} 
       ' "$1">$new_file 
else 
        awk -v OLD=$string_to_replace -v NEW=$3 ' 
            ($0 == OLD) {gsub(OLD, NEW); count++}1 
            END{print count " substitutions occured."} 
       ' "$1">$new_file 
fi 

# Print number of changes in terminal 
tail -1 $new_file 
sed -i '$d' $new_file 
