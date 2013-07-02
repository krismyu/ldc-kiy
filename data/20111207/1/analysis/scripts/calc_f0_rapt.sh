#! /bin/bash
## CALC_F0_RAPT.SH
## Time-stamp: <2011-03-23 10:44:07 amoebe>
## This small script, based off of Chilin Shih's https://netfiles.uiuc.edu/cls/www/course/ling591corpus/Linux/f0handout.html, batch calculates f0 tracks using RAPT (get_f0 from ESPS), using parameters given in Pget_f0, and then converts the binary file format to ASCII. 
## Input: $1 Directory name (absolute path) where wave files are
##        $2 Save directory (absolute path), make sure it's already created
##        Pget_f0: file with parameters, in working directory
## Output: Binary .f0 files in Save directory
##         ASCII .f0.p files in Save directory
##         Copied Pget_f0 parameters to Save directory

WD=$PWD # Save current working directory path

cd $1 # Enter directory of wave files to run over

# Loop over wave files in directory, save output files to Save directory $2
for i in *.wav
do
    basename=${i%.wav} # Strip ".wav" suffix off filename
    echo $PWD
    echo $i
    echo $basename
    get_f0 -P $WD/Pget_f0 $i $2/$basename.f0 # Extract pitch, using Pget_f0 params
    pplain $2/$basename.f0 >$2/$basename.f0.p # Convert to ASCII file, .f0.p extension
done

cd $WD # Return to current working directory
cp Pget_f0 $2/ # Copy parameter settings to save directory for record keeping
