#!/bin/sh
# Argument: hash file

#sed 1d $1 # Remove header line before processing
#perl -pi -e 's/\r/\n/g' $1 #Didn't work when I ran this in this script, had to run directly in terminal????

sed 1d $1 | cut -f1 > temp-item # Extract item column for item label
sed 1d $1 | cut -f8 > temp-frame # Extract frame column for frame label
sed 1d $1 | cut -f3 > temp-target-init
sed 1d $1 | cut -f4 > temp-tone1
sed 1d $1 | cut -f5 > temp-tone2
paste -d'_' temp-target-init temp-frame > temp-target  # Create target label
paste -d'_' temp-tone1 temp-tone2 > temp-tone  # Create tone label
paste -d':' temp-target temp-tone > temp-target-tone # Create target:tone label

# For some reason I could not run paste like this when I ran the script, but I could if I directly used this command in the terminal????
#paste -d'_' <(sed 1d $1 | cut -f4) <(sed 1d $1 | cut -f5) > temp-tone  # Create tone label


## Call Praat script label_textgrids_from_hash.praat
echo "******************************"
echo "Don't panic! label_textgrids_from_hash.praat is busy labeling textgrid for you!"
echo "If you are asked for your password, give your administrator password to get access to executing Praat."
sudo /Applications/Praat.app/Contents/MacOS/Praat /Users/amoebe/desk/anu/scripts/label-textgrids-from-hash.praat /Users/amoebe/desk/anu/wav/raw/20111212-1-kiy-ap-toneset-down.TextGrid /Users/amoebe/desk/anu/wav/raw/temp-target-tone 1 1 1

sudo /Applications/Praat.app/Contents/MacOS/Praat /Users/amoebe/desk/anu/scripts/label-textgrids-from-hash.praat /Users/amoebe/desk/anu/wav/raw/20111212-1-kiy-ap-toneset-down.TextGrid /Users/amoebe/desk/anu/wav/raw/temp-frame 2 1 1

sudo /Applications/Praat.app/Contents/MacOS/Praat /Users/amoebe/desk/anu/scripts/label-textgrids-from-hash.praat /Users/amoebe/desk/anu/wav/raw/20111212-1-kiy-ap-toneset-down.TextGrid /Users/amoebe/desk/anu/wav/raw/temp-item 3 1 1

rm -f temp-tone1; rm -f temp-tone2; rm -f temp-target-tone; rm -f temp-target; rm -f temp-target-init; rm -f temp-item; rm -f temp-frame; rm -f temp-tone

