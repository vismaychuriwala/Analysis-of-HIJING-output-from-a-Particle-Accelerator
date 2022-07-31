#!/bin/bash
dir=${1}
curr=$( pwd; )
[[ -f AnalysisResults.root ]] && rm AnalysisResults.root
root -l -b -q initialize.C
for i in {0..9};
do
root -l -b -q readDataFromTTree.C\(\"$dir/${i}/HIJING_LBF_test_small.root\"\)
done
root -l -b -q show.C
cd $curr
return 0;
