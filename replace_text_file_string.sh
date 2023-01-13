#! usr/bin/bash

# Check if there are 3 parameters

if [ "$#" -ne 3 ]; then
        echo "Error: Send 3 parameters."
fi

# check if first parameter is a valid file path

if ! [ -e $1 ]; then
        echo "First parameter has to be a valid file path."
        echo "File does't exist."
fi

## should you check if file access modifier let's you copy?


directory_path="${1%/*}"
original_file_name="$(basename $1)"
echo $original_file_name
echo $directory_path

