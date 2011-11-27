#!/bin/bash

# $1 input filename
# $2 background fill
# $3 background stroke
# $4 forground
# $5 png size
# $6 output filename

#Variables DON'T TOUCH THEM
NO_ARG=0
MAX_ARG=6

###  FUNCTION FOR HELP ##
usage()
{
  echo "Usage: `basename $0` options in_filename back_fill_color back_stroke_color forground_color png_size out_filename

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

echo "recolour_new.sh $1 \"$2\" \"$3\" \"$4\" | rsvg -f png -w ${5} -h ${5} /dev/stdin ${6}.png"
recolour.sh $1 "$2" "$3" "$4" | rsvg -f png -w ${5} -h ${5} /dev/stdin ${6}.png
