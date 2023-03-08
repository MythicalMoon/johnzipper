#!/bin/bash

# loop through all zip files in the folder
for file in *.zip
do
    # create hash file for the zip file
    zip2john "$file" > "${file%.zip}.hash"
    
    # run john on the hash file with rockyou.txt as the wordlist
    john --wordlist=/usr/share/wordlists/rockyou.txt "${file%.zip}.hash"
done
