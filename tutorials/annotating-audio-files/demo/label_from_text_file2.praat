# This script reads lines from a text file (called labels.txt and saved in the home directory)
# and adds them line by line as labels for intervals in a selected TextTier in the selected TextGrid object.
#
# You should check that the boundaries are correct before running the script.
# The script will jump over intervals labeled as "xxx". Use this marking if there are intervals that
# you will remove later.
# Hint: This tool is useful if you use the mark_pauses script before it! It is easy to check that the
# pause boundaries are in correct places, if you know what kind of content should be in the sound
# segments - e.g., read sentences.
#
# This script is distributed under the GNU General Public License.
# Mietta Lennes 25.1.2002
#
soundname$ = selected$ ("TextGrid", 1)
select TextGrid 'soundname$'
stringlength = 0
filelength = 0
firstnewline = 0
oldlabel$ = ""
newlabel$ = ""
form Label intervals in an IntervalTier from text file
comment Give the path of the text file containing the label lines:
sentence Filename ~/ldc/tutorials/annotating-audio-files/your-turn/numeric-labels.txt
comment Which IntervalTier in the selected TextGrid do you want to label?
integer Tier_(index) 1 (= the first IntervalTier)
comment Which interval do we start labeling from?
integer Starting_interval_(index) 1 (= the first interval)
comment Do you want to overwrite old labels?
comment (Intervals previously marked with 'xxx' will be skipped despite this!)
boolean Overwrite 1
endform

if fileReadable (filename$)
numberOfIntervals = Get number of intervals... tier
if starting_interval > numberOfIntervals
exit There are not that many intervals in the IntervalTier!
endif
leftoverlength = 0
# Read the text file and put it to the string file$
file$ < 'filename$'
if file$ = ""
	exit The text file is empty.
endif
filelength = length (file$)
leftover$ = file$
# Loop through intervals from the selected interval on:
for interval from starting_interval to numberOfIntervals
oldlabel$ = Get label of interval... tier interval
if oldlabel$ <> "xxx" and left$ (oldlabel$,1) <> "."
# Here we read a line from the text file and put it to newlabel$:
firstnewline = index (leftover$, newline$)
newlabel$ = left$ (leftover$, (firstnewline - 1))
leftoverlength = length (leftover$)
leftover$ = right$ (leftover$, (leftoverlength - firstnewline))
# Then we check if the interval label is empty. If it is or if we decided to overwrite, 
# we add the new label we collected from the text file:
    if overwrite = 1
		      	Set interval text... tier interval 'newlabel$'
			elsif oldlabel$ = ""
		      Set interval text... tier interval 'newlabel$'
			else 
					exit Stopped labeling, will not overwrite old labels!
   endif
endif
endfor
else 
	exit The label text file 'filename$' does not exist where it should!
endif
