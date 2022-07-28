#!/bin/bash
dirn=${1}
cd $dirn
while read File; do
cd $dirn/$(dirname $File) # go to the directory where the current file in the loop sits
cp $(basename $File) backup_0.dat
#echo $File
awk '{if ($3 == 0) print $0}' < backup_0.dat 1>$(basename $File)
[[ -f backup_0.dat ]] && rm backup_0.dat
done < <(find -type f -name "event_*.dat")

cd
return 0
