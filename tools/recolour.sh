#!/bin/bash

# $1 filename
# $2 background fill
# $3 background stroke
# $4 forground

#Variables DON'T TOUCH THEM
NO_ARG=0
MAX_ARG=4

###  FUNCTION FOR HELP ##
usage()
{
  echo "Usage: `basename $0` options filename back_fill_color back_stroke_color forground_color

Options:
    -h          print this help
"
}

#check if there are no argument or more than one to print help
if [ $# -eq "$NO_ARG" -o $# -gt "$MAX_ARG" ] ; then
    usage
    exit 
fi

#check the option used
while getopts "h" Options
do
    case $Options in
        #print help
        h ) usage; exit;;
    esac
done

sed "s/fill:#111111/fill:${2};/g" < $1 | sed "s/fill:#111;/fill:${2};/g" | sed "s/stroke:#eeeeee/stroke:${3};/g" | sed "s/stroke:#eee;/stroke:${3};/g" | sed "s/fill:white/fill:${4};/g" | sed "s/stroke:white/stroke:${4};/g" | sed "s/fill:#ffffff/fill:${4};/g" | sed "s/stroke:#ffffff/stroke:${4};/g"
