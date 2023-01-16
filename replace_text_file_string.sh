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


 ## sed -i "s/$2/$3/" $1 >$new_file
 perl -i  -lpe '$chnage_counter+= s/$2/$3/g; END{print "$chnage_counter"}' $1 > $new_file
 echo $chnage_counter
 
 ## korisniku izbaci na ekran koliko je promjena napravljeno
 
 ## should you put a \ before an asterisk?
