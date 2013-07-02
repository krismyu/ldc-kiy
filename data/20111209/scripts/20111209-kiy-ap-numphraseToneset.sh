grep '[[:alpha:]]' 20111209-kiy-ap-Datasets-ky.txt | cut -f1  > 20111209-kiy-ap-Datasets-ky-item.txt # ignore blank lines and save first column for labels for item tier


grep '[[:alpha:]]' 20111209-kiy-ap-Datasets-ky.txt | cut -f5  > 20111209-kiy-ap-Datasets-ky-frame.txt # ignore blank lines and save fifth column for frame label, blank labels if isolation

# For target labels, I want to have frame label in there, too, and then colon tone labels
grep '[[:alpha:]]' 20111209-kiy-ap-Datasets-ky.txt | cut -f5  > 20111209-kiy-ap-Datasets-ky-frame.txt # ignore blank lines and save fifth column for frame label, blank labels if 

paste -d'-' <(grep '[[:alpha:]]' 20111209-kiy-ap-Datasets-ky.txt | cut -f3) 20111209-kiy-ap-Datasets-ky-frame.txt > 20111209-kiy-ap-Datasets-ky-target.txt

### Now add in colon and tone target
paste -d':' 20111209-kiy-ap-Datasets-ky-target.txt <(grep '[[:alpha:]]' 20111209-kiy-ap-Datasets-ky.txt | cut -f4) > 20111209-kiy-ap-Datasets-ky-target-tone.txt

