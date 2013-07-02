# Time-stamp: <2013-05-09 21:49:57 amoebe>

############################## CODE SNIPPET 1 ##########################################
### LABELING 20111215-2-kiy-ap-framedwordlist1.TextGrid3 ################################

cd ~/fkiy/ldc-kiy/kiy/20111215/2/info/ # Change directory to the one with hash tables
wc -l 20111215-2-kiy-ap-framedwordlist-rand.txt # Check number of lines in elicitation session
cut -f1 20111215-2-kiy-ap-framedwordlist-rand.txt > item.tmp # Write just item numbers to item.tmp
paste -d'\n' item.tmp item.tmp > item2.tmp # Write item numbers, each repeated once, to item2.tmp
printf 'a\nb\n%.0s' {1..100} > rep.tmp # Create text file with 100 'a\nb' for labeling repetitions
paste -d'\0' item2.tmp rep.tmp > labels.tmp # Write item numbers + repetition code to labels.tmp

sed -n 1,50p labels.tmp > labels1.tmp # Extract labels for Session 1 of 20111215-2-kiy-ap-framedwordlist.

# labels1.tmp used to create labels in Tier 2 for 20111215-2-kiy-ap-framedwordlist1.TextGrid3


########################################################################################

############################## CODE SNIPPET 2 ##########################################
### LABELING 20111215-2-kiy-ap-framedwordlist2.TextGrid3 ################################

cd ~/fkiy/ldc-kiy/kiy/20111215/2/info/ # Change directory to the one with hash tables
tail -106 labels.tmp

sed -n 51,100p labels.tmp > labels2.tmp # Extract labels for Session 2 of 20111215-2-kiy-ap-framedwordlist.
# labels2.tmp used to create labels in Tier 2 for 20111215-2-kiy-ap-framedwordlist2.TextGrid3


rm item.tmp item2.tmp rep.tmp labels.tmp # clean up and remove temporary files

########################################################################################

