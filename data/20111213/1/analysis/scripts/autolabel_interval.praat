## Praat script by Kristine Yu 
## Bole tone data preprocessing
## Time-stamp: <2013-06-19 08:22:13 amoebe>
## autolabel_interval.praat

## This script writes in numeric labels for textgrids automatically for Bole tone data for processing with TimeNormalizeF0.praat.

# Form asks for directory where files are, make sure you put slash at end of directory name
# Tier is the name of the tier in the created text grid
# Label is the new label for the voiced interval of interest. Same label for all files looped over
form Select directory, file type, tiers, and label
	sentence Directory /Users/amoebe/ldc/data/20111213/1/data/tokens/
	sentence Filename_initial_substring_(optional) 
        sentence Extension TextGrid
endform

## Create list of files to loop over
Create Strings as file list... list 'directory$''filename_initial_substring$'*.'extension$'
file_count = Get number of strings

## Loop through files and make grids 

for k from 1 to file_count
     select Strings list
     current$ = Get string... k
     Read from file... 'directory$''current$'
     short$ = selected$ ("TextGrid")

## Below: look for grid, if found, open it, otherwise make new one

     full$ = "'directory$''short$'.TextGrid"
     if fileReadable (full$)
  	Read from file... 'full$'
  	Rename... 'short$'
   #  else
  #	select Sound 'short$'
  #	To TextGrid... "'tier$'" 
     endif

#     plus Sound 'short$'

# ## Ask user to handcorrect boundaries of interest and select voiced interval of interest, get the start and end times of the interval
#      Edit
#      editor TextGrid 'short$'
#      pause Correct voiced region and select, then press Continue....
#      voi_init = Get starting point of interval
#      voi_fin = Get end point of interval
#      endeditor

# ## Create new textgrid overwriting old one, with boundaries just for the voiced region of interest, labeled and with tier name as specified in form	  
#      select Sound 'short$'
#      To TextGrid... "'tier$'"
#     Set point text... 1 1 L
#     Set point text... 1 1 H
     number_of_intervals = Get number of intervals... 1
     if number_of_intervals = 4
     Set interval text... 1 2 W1
     Set interval text... 1 3 W2
     endif

#     Set interval text... 3 2 word
#     minus  'short$'
     Write to text file... 'directory$''short$'.TextGrid
     select all
     minus Strings list
     Remove
endfor

select Strings list
Remove
clearinfo
echo Done. 'file_count' files annotated.
