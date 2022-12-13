#!/bin/bash

show_help() {
  echo "provide <firstName> <lastName> <age> <gender>";  
}

firstName=$1;
lastName=$2;
age=$3;
gender=$4;

if [ "${firstName^^}" = "HELP" ];
  then
    show_help
    exit 1;
fi


if [ $# != 4 ];
  then 
    echo "not enought arguments";
    show_help 
    exit 1
fi
 
echo "${firstName} ${lastName} ${age} ${gender}"

