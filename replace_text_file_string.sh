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

# Create empty -changed file
directory_path="${1%/*}"
original_file_name_with_extension="$(basename $1)"
original_file_name="${original_file_name_with_extension%.*}"
extension="${original_file_name_with_extension##*.}"
new_file="$directory_path""/""$original_file_name""_changed.""$extension"

## is the line below needed? what if the file already exists, so you just need to override it?
cp $1 $new_file

## you could just place func to replace string before >$new_file, so you can create and fill that new_file in one line

awk -v OLD=$2 -v NEW=$3 '
    ($0 ~ OLD) {gsub(OLD, NEW); count++}1
    END{print count " substitutions occured."}
' "$new_file">>$new_file 

tail -1 $new_file 
sed -i '$d' $new_file  

#sed -i "s/$2/$3/" $new_file

#perl -i  -lpe '$chnage_counter+= s/$2/$3/g; END{print "$chnage_counter"}' $new_file
#echo $chnage_counter
#perl -i  -lpe '$k+= s/$2/$3/g; END{print "$k"}' $new_file
#change_counter=0
#sed -i "s/$2/$3/g;" $new_file
#if [ -s changelog.txt ]; then
#       $change_counter=$change_counter+1
#fi
#echo $change_counter

 ## korisniku izbaci na ekran koliko je promjena napravljeno
 ## should you put a \ before an asterisk?
