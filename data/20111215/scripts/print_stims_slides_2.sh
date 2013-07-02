#!/bin/sh
# Time-stamp: <2011-12-15 12:32:32 amoebe>

# Randomize
sed 1d 20111215-2-kiy-ap-framedwordlist.txt > temp
perl ~/docs/mind/scripts/perl/rand_lines.pl temp > 20111215-2-kiy-ap-framedwordlist-rand.txt
rm -f temp

# Print tex file
perl print_stims_slides_2.pl 20111215-2-kiy-ap-framedwordlist-rand.txt > 20111215-2-kiy-ap-framedwordlist.tex

# Output tex file as pdf
pdflatex 20111215-2-kiy-ap-framedwordlist.tex