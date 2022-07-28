#!/bin/bash
i=0;
Dir=~/Dir   #Choose the name of the directory you want your files in
data=${1}    #location of data as arguement
[[ -d ${Dir} ]] || mkdir ${Dir}
cd ${data}
for i in {0..9}; do
cd ${data}/${i}
arr=( $(grep -n BEGINNINGOFEVENT HIJING_LBF_test_small.out | awk 'BEGIN{FS=":"}{print $1}') )
arr[10]=$(awk 'END { print NR }' HIJING_LBF_test_small.out)
[[ -d ${Dir}/${i} ]] || mkdir ${Dir}/${i}
cp ${data}/${i}/HIJING_LBF_test_small.out ${Dir}/${i}/HIJING_LBF_test_small.out
for j in {0..9}; do
sed -n ${arr[j]},${arr[j+1]}p HIJING_LBF_test_small.out > ${Dir}/${i}/event_${j}.dat
done

done
cd
return 0
