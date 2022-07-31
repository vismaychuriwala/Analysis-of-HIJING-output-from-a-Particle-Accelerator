#!/bin/bash
dir=${1};
curr=$( pwd; )
source ~/root/bin/thisroot.sh
for i in {0..9}; do
cd ${dir}/${i};
[[ -f HIJING_LBF_test_small.root ]] && rm HIJING_LBF_test_small.root

cat > importASCIIfileIntoTTree.C <<HERE-DOC
#include "TFile.h"
#include "TTree.h"

int importASCIIfileIntoTTree(const char *filename)
{
 TFile *file = new TFile("HIJING_LBF_test_small.root","update"); // open ROOT file named 'HIJING_LBF_test_small.root', where TTree will be saved
 TTree *tree = new TTree("event","data from ascii file"); // make the new TTree for each event

 Long64_t nlines = tree->ReadFile(filename,"label:pid:id:dec:px:py:pz:E");
 tree->Write(); // save TTree to 'output.root' file
 file->Close();

 return 0;
}
HERE-DOC

(
for j in {0..9}; do
:
root -l -b -q importASCIIfileIntoTTree.C\(\"${dir}/${i}/event_${j}.dat\"\) 1> /dev/null
done
rm importASCIIfileIntoTTree.C
) &
done
wait
cd ${curr}
return 0;
