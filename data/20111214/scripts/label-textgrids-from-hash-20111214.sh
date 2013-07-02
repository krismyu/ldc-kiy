#!/bin/sh
# Argument: hash file

#sed 1d $1 # Remove header line before processing
#perl -pi -e 's/\r/\n/g' $1 #Didn't work when I ran this in this script, had to run directly in terminal????

 cut -f1 $1 > temp-item # Extract item column for item label
 cut -f10 $1 > temp-pattern # Extract frame column for frame label
 cut -f7 $1 > temp-verb # Extract frame column for frame label
 cut -f8 $1 > temp-tone1
 cut -f9 $1 > temp-tone2
 cut -f2 $1 > temp-tar1
 cut -f3 $1 > temp-tar2
paste -d'-' temp-pattern temp-verb > temp-frame
#paste -d'-' temp-t1 temp-frame > temp-tar1
#paste -d'-' temp-t2 temp-frame > temp-tar2
paste -d':' temp-tar1 temp-tone1 > temp-target1  # Create target label 1
paste -d':' temp-tar2 temp-tone2 > temp-target2  # Create target label 2
awk '{print $4 ":verb"}' $1 > temp-verb2 # Create verb label
paste -d'\n' temp-target1 temp-target2 temp-verb2 > temp-target # Create target label from interspersed label 1/2

# For some reason I could not run paste like this when I ran the script, but I could if I directly used this command in the terminal????
#paste -d'_' <( cut -f4) <( cut -f5) > temp-tone  # Create tone label


## Call Praat script label_textgrids_from_hash.praat
echo "******************************"
echo "Don't panic! label_textgrids_from_hash.praat is busy labeling textgrid for you!"
echo "If you are asked for your password, give your administrator password to get access to executing Praat."
sudo /Applications/Praat.app/Contents/MacOS/Praat /Users/amoebe/desk/anu/scripts/label-textgrids-from-hash.praat /Users/amoebe/desk/anu/20111214/20111214-3-kiy-ap-framedwordlist.TextGrid /Users/amoebe/desk/anu/20111214/temp-target 1 1 1

sudo /Applications/Praat.app/Contents/MacOS/Praat /Users/amoebe/desk/anu/scripts/label-textgrids-from-hash.praat /Users/amoebe/desk/anu/20111214/20111214-3-kiy-ap-framedwordlist.TextGrid /Users/amoebe/desk/anu/20111214/temp-frame 2 1 1

sudo /Applications/Praat.app/Contents/MacOS/Praat /Users/amoebe/desk/anu/scripts/label-textgrids-from-hash.praat /Users/amoebe/desk/anu/20111214/20111214-3-kiy-ap-framedwordlist.TextGrid /Users/amoebe/desk/anu/20111214/temp-item 3 1 1

rm -f temp-tone1; rm -f temp-tone2; rm -f temp-target; rm -f temp-target-init; rm -f temp-item; rm -f temp-frame; rm -f temp-tar1; rm -f temp-tar2; rm -f temp-target1; rm -f temp-target2; rm -f temp-pattern; rm -f temp-verb; rm -f temp-verb2

