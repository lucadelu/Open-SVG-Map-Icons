#!/bin/sh
#
#    Copyright 2011 Luca Delucchi
#    lucadeluge@gmail.com
#
#
#    This program is free software; you can redistribute it and/or odify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

##Convert a svg file to png with the color that you pass

#Variables DON'T TOUCH THEM
NO_ARG=0
SIZE=32

###  FUNCTION FOR HELP ##
usage()
{
  echo "Usage: `basename $0` options required

Required:
    -f          path to svg file
    -c          color to use

Options:
    -h          print this help
    -s          size to use (default 32)
"
}

#check if there are no arguments to print help
if [ $# -eq "$NO_ARG" ] ; then
    usage
    exit 
fi

#check the option used
while getopts "f:c:s:h" Options
do
    case $Options in
        # save the path to svg file 
        f) if [ -n $OPTARG ] ; then 
                FILE=$OPTARG
           fi;;
        # save the color 
        c) if [ -n $OPTARG ] ; then 
                COLOUR=$OPTARG
           fi;;
        # save the size 
        s) if [ -n $OPTARG ] ; then 
                SIZE=$OPTARG
           fi;;
        #print help
        h ) usage; exit;;
    esac
done

if [ "$FILE" ] ; then

  if [ "$COLOUR" ] ; then

    BASENAME=`basename $FILE .svg`
    FULLPATH=`readlink -f ${FILE}`

    recolourtopng.sh ${FULLPATH} 'none' 'none' ${COLOUR} ${SIZE} ${BASENAME}.p.${SIZE}
    
    recolourtopng.sh ${FULLPATH} ${COLOUR} ${COLOUR} '#ffffff' ${SIZE} ${BASENAME}.n.${SIZE}
    
    convert ${BASENAME}.p.${SIZE}.png \( +clone -background '#ffffff' -shadow 8000x2-0+0 \) +swap -background none -layers merge +repage -trim ${BASENAME}.glow.${SIZE}.png

  else

  echo "ERROR: you have to set -f and -c option"
  usage

  fi

else 

  echo "ERROR: you have to set -f and -c option"
  usage
fi