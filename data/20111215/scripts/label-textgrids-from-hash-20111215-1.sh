#!/bin/sh
# Argument: hash file

#sed 1d $1 # Remove header line before processing
#perl -pi -e 's/\r/\n/g' $1 #Didn't work when I ran this in this script, had to run directly in terminal????

cut -f1 $1 > temp-item # get item label
cut -f8 $1 > temp-frame # get frame label
paste -d'\n' temp-frame temp-frame > temp-frame2 # I put in both reps this t
paste -d'\n' temp-frame temp-frame temp-frame temp-frame > temp-frame4 # I put in both reps this time, so I need to repeat each frame label twice 
paste -d'\n' temp-item temp-item temp-item temp-item > temp-item4 # Get item label for tagging vowels for phonetic analysis
cut -f2 $1 > temp-tar1 # get target 2 label
cut -f4 $1 > temp-tar2 # get target 2 label
paste -d'\n' temp-tar1 temp-tar2 temp-tar1 temp-tar2 > temp-tar # get target label
cut -f6 $1 > temp-tone1
cut -f7 $1 > temp-tone2

# put in repetition number too  MUST BE REDONE BY HAND EACH TIME!!
# for i in $(jot 32); do
#     cat <(jot 1; jot 1; jot 1 2; jot 1 2) >> temp-rep
# done

paste -d'\n' temp-tone1 temp-tone2 temp-tone1 temp-tone2 > temp-tone # get toneget label
paste -d':' temp-tar temp-tone > temp-target  # Create target label
paste -d':' temp-tar temp-tone temp-frame4 temp-item4 temp-rep > temp-vowel  # Create vowel label

# For some reason I could not run paste like this when I ran the script, but I could if I directly used this command in the terminal????
#paste -d'_' <( cut -f4) <( cut -f5) > temp-tone  # Create tone label


## Call Praat script label_textgrids_from_hash.praat
echo "******************************"
echo "Don't panic! label_textgrids_from_hash.praat is busy labeling textgrid for you!"
echo "If you are asked for your password, give your administrator password to get access to executing Praat."

sudo /Applications/Praat.app/Contents/MacOS/Praat /Users/amoebe/desk/anu/scripts/label-textgrids-from-hash.praat /Users/amoebe/desk/anu/20111215/20111215-1-kiy-ap-framedwordlist2.TextGrid /Users/amoebe/desk/anu/20111215/temp-vowel 1 1 1


sudo /Applications/Praat.app/Contents/MacOS/Praat /Users/amoebe/desk/anu/scripts/label-textgrids-from-hash.praat /Users/amoebe/desk/anu/20111215/20111215-1-kiy-ap-framedwordlist2.TextGrid /Users/amoebe/desk/anu/20111215/temp-target 2 1 1

sudo /Applications/Praat.app/Contents/MacOS/Praat /Users/amoebe/desk/anu/scripts/label-textgrids-from-hash.praat /Users/amoebe/desk/anu/20111215/20111215-1-kiy-ap-framedwordlist2.TextGrid /Users/amoebe/desk/anu/20111215/temp-frame2 3 1 1

#sudo /Applications/Praat.app/Contents/MacOS/Praat /Users/amoebe/desk/anu/scripts/label-textgrids-from-hash.praat /Users/amoebe/desk/anu/20111215/20111215-1-kiy-ap-framedwordlist1.TextGrid /Users/amoebe/desk/anu/20111215/temp-item 3 1 1

rm -f temp-tone1; rm -f temp-tone2; rm -f temp-target; rm -f temp-item; rm -f temp-frame; rm -f temp-frame2; rm -f temp-tar1; rm -f temp-tar2; rm -f temp-tar; rm -f temp-frame4; rm -f temp-item4; rm -f temp-item; rm -f temp-rep


