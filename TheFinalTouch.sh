#!/bin/bash

[[ ! -d $1 ]] && echo "Not a valid directory!" && return 6

source Splitter.sh $1 && echo "Done with Splitter.sh" || return 5  #data folder in 1st arguement, name of folder you want in the 2nd
source Filter.sh $2 && echo "Done with Filter.sh" || return 4
source Transfer.sh $2 && echo "Done with Transfer.sh" || return 3
source Analysis.sh $2 && echo "Done with Analysis.sh" || return 2

return 0
