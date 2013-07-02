#! /bin/bash
## GET_TIMESTAMPS.SH
## Time-stamp: <2011-06-06 13:50:19 amoebe>
## COMMENT ME!

WD=$PWD # save current directory
cd $1 #go to directory with files

# Get file name
ls *.TextGrid > file-temp

# Get syllable 1 time stamps
grep -B2 'S1' *.TextGrid | grep -o 'xmin.*' | sed 's/[a-z]* = \(.*\)/\1/' > xmin-temp
grep -B2 'S1' *.TextGrid | grep -o 'xmax.*' | sed 's/[a-z]* = \(.*\)/\1/' > xmax-temp 

# Get syllable 2 time stamps
grep -B2 'S2' *.TextGrid | grep -o 'xmin.*' | sed 's/[a-z]* = \(.*\)/\1/' > xmin-temp-2
grep -B2 'S2' *.TextGrid | grep -o 'xmax.*' | sed 's/[a-z]* = \(.*\)/\1/' > xmax-temp-2
 
# Make header
echo -e 'filename\ts1.start\ts1.end\ts2.start\ts2.end' > $2/syll-timestamps.txt

paste -d'\t' file-temp xmin-temp xmax-temp xmin-temp-2 xmax-temp-2 >> $2/syll-timestamps.txt
rm -f file-temp; rm -f xmin-temp; rm -f xmax-temp; rm -f xmin-temp-2; rm -f xmax-temp-2