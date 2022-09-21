# final_project_hep_vismay
This repository contains code meant for the Fully automated analysis of HIJING output from a particle accelerator.
In this project, I combined Linux, Bash and ROOT functionalities in order to fully automate the data analysis over one typical HIJING dataset, generated in 10 separate jobs on a local batch farm.
This dataset corresponds to the HIJING model prediction for the collisions of heavy ions (Pb-Pb) at a collision energy of 2.76 TeV. That was the heavy-ion colliding system and energy used in Run 1 operations (2009-2013) at Large Hadron Collider.
There are 4 steps involved:

Splitting: This step involves spliting in each of the subdirectories 0, 1, ..., 9 the large HIJING output file HIJING_LBF_test_small.out in 10 separate files named event_0.dat, ..., event_9.dat . Each of these new files contains the data only for a particular event.

Filtering: Then, this script filters in each of the subdirectories 0, 1, ..., 9 out of each new file event_?.dat obtained in the previous step only the information for the primary particles (i.e. particles with the label 0 in the 3rd column).

Transferring: This script is responsible to process all filtered files event_?.dat and store for each event for each particle its PID and kinematics (three components of momenta and energy) into ROOT's container TTree. We make one TTree container for each event, and then all TTree containers save in one common ROOT file named HIJING_LBF_test_small.root, in each of the subdirectories 0, 1, ..., 9. After the transfer, we clean up all files event_?.dat

Analysis: his script is responsible to collect all ROOT files HIJING_LBF_test_small.root obtained in the previous step, and hand them over to dedicated ROOT macros for the final analysis. For the whole dataset, i.e. for all 100 heavy-ion collisions, this final script needs to produce:
figure (in 4 standard formats .pdf,.eps, .png and .C) holding the 3 histograms plotted side-by-side, with distributions of transverse momentum for pions, kaons and protons, respectively (to increase statistics, take that particles and antiparticles are the same). Transverse momentum is the Lorentz invariant quantity defined as:

pT = (px^2+py^2)^0.5

printouts in the terminal with the following format and content:
Average pT for the whole dataset:
o pions   = ??? GeV/c
o kaons   = ??? GeV/c   
o protons = ??? GeV/c

Finally we, Automate the whole procedure.
Copy all the files in the same Directory and run . TheFinalTouch.sh ${data_file} ${Directory for unpacked files(so that data_file is untouched)}
