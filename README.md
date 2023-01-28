# ShellScript-Replace-String-In-Text-File

This script allows users to replace a piece of text with another. The original file who's text should be replaced will remain unchanged, but a new file called <original_file_name>_changed will be created. After this script is executed it will also print out the number of changes in the terminal. The script features error checking.

The script can handle replacing strings which contain an asterisk. So if a file contains words:
- file1
- file2
- file3

You can just use file* to change all the lines to whatever you like. 

To execute the string you need to enter 3 arguments. First argument will be a valid path to the file who's content you want to change. The second argument is a word which is contained in the file, and which you want to replace with another word. Argument 3 will be the new word which will replace word from argument 2 in the new file.
