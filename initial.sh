#!/binq/bash

# utils
list() {
ls -lah $1
sleep 2s
}


finish(){
echo "-$(tput setaf 1)-------------------------$(tput setaf 7)"
}



# Change directory owner and group like <unsername>:root

mkdir dir
sudo chown ${whoami}:root dir
list
rm -r dir
list
finish


# Tasks

#  Create directory
mkdir dir
rm -r dir
finish

# Create multiple dirs
mkdir lesson{1..4}
echo "created four directories"
sleep 1s

list 
finish



# Remove not empty directory

touch lesson1/index lesson2/main
echo "created index and main files"
sleep 1s

list lesson1 

rm -R lesson1
echo "lesson1 is delted"

list
finish

# Create empty file

touch file 
echo "file is created" 
list file
finish

# Remove file

rm file

echo "deleting previous directories"
rm -r lesson{2..4}
list
finish


#  Set permission for directory -r-x -w- --x

mkdir dir

chmod 521 dir
sleep 1
list
rm -r dir
finish




