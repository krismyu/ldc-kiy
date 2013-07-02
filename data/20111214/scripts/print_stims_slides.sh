#!/bin/sh
# Time-stamp: <2011-12-14 13:23:24 amoebe>

# Randomize
sed 1d 20111214-1-kiy-ap-framedwordlist.txt > temp
perl ~/docs/mind/scripts/perl/rand_lines.pl temp > 20111214-1-kiy-ap-framedwordlist-rand.txt
rm -f temp

# Print tex file
perl print_stims_slides.pl 20111214-1-kiy-ap-framedwordlist-rand.txt > 20111214-1-kiy-ap-framedwordlist.tex

# Output tex file as pdf
pdflatex 20111214-1-kiy-ap-framedwordlist.tex