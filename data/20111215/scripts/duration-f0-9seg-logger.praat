###Description of this script
##  This script the duration of all intervals marked in tier 1 with non-null lables.  Durations, in milliseconds
##   will be written to a log file called "dur-f0-analysis.log", which you will be able to find in the same directory
##  holding your sound files after you run the script.
##  To run this script, you will have to have a bunch of sound files with accompanying text grids.  Actually,
##   the sound files are superfluous, since they are not needed to get duration. You could run this script
##   on a directory that had only text grids in it, but it is more likely that you will have both sounds and text grids.
##   The sound files will be ignored. The locations of things to be measured must be marked in tier 1 of the textgrid.  
##   Anything with a non-null label in that tier will be logged.
###End of description

##  Specify the directory containing your sound files in the next line:

directory$ = "/Users/amoebe/desk/anu/20111215/analysis/"

##  Now we will do some prep work to get your log file ready.  The first thing I usually do is
##  make sure that I delete any pre-existing variant of the log:

filedelete 'directory$'duration-analysis.log
filedelete 'directory$'f0-analysis.log

##  Now I'm going to make a variable called "header_row$", then write that variable to the log files:

header_row$ = "Filename" + tab$ + "no." + tab$ + "label" + tab$ + "start (ms)" + tab$ + "Duration(ms)" +  newline$
header_row$ > 'directory$'duration-analysis.log

header_row$ = "Filename" + tab$ + "no." + tab$ + "label" + tab$ + "f0.1" + tab$ + "f0.2" + tab$ + "f0.3" + "f0.4" + "f0.5" + "f0.6" + "f0.7" + "f0.8" + "f0.9" +  newline$
header_row$ > 'directory$'f0-analysis.log

##  Now we make a list of all the text grids in the directory we're using, and put the number of
##  filenames into the variable "number_of_files":

Create Strings as file list...  list 'directory$'*.wav
number_files = Get number of strings

# Then we set up a "for" loop that will iterate once for every file in the list:

for j from 1 to number_files

     #    Query the file-list to get the first filename from it, then read that file in:

     select Strings list
     current_token$ = Get string... 'j'
     Read from file... 'directory$''current_token$'

     #    Here we make a variable called "object_name$" that will be equal to the filename minus the ".wav" extension:

     object_name$ = selected$ ("Sound")



     #  Now we figure out how many intervals there are in tier 1, and step through them one at a time.
     #  If an intervals label is non-null, we get its duration and write it to the log file.

Read from file... 'directory$''object_name$'.TextGrid

select TextGrid 'object_name$'

     number_of_intervals = Get number of intervals... 1
     for b from 1 to number_of_intervals
          interval_label$ = Get label of interval... 1 'b'
          if interval_label$ <> "" and interval_label$ <> "xxx" and left$ (interval_label$,1) <> "."
               begin_vowel = Get starting point... 1 'b'
               end_vowel = Get end point... 1 'b'
               duration = (end_vowel - begin_vowel) * 1000

 fileappend "'directory$'duration-analysis.log" 'object_name$''tab$' 'b' 'tab$' 'interval_label$''tab$' 'begin_vowel:3' 'tab$' 'end_vowel:3' 'tab$' 'duration:3''newline$' 
 
endif

endfor

select Sound 'object_name$'
# Now do pitch calculations
To Pitch... 0.005 75 600

Read from file... 'directory$''object_name$'.TextGrid
select TextGrid 'object_name$'

     number_of_intervals = Get number of intervals... 1
     for b from 1 to number_of_intervals
          interval_label$ = Get label of interval... 1 'b'
          if interval_label$ <> "" and interval_label$ <> "xxx" and left$ (interval_label$,1) <> "."
               begin_vowel = Get starting point... 1 'b'
               end_vowel = Get end point... 1 'b'
               duration_s = (end_vowel - begin_vowel)
               t_1 = begin_vowel + duration_s/9 
               t_2 = begin_vowel + 2*duration_s/9 
               t_3 = begin_vowel + 3*duration_s/9 
               t_4 = begin_vowel + 4*duration_s/9 
               t_5 = begin_vowel + 5*duration_s/9 
               t_6 = begin_vowel + 6*duration_s/9 
               t_7 = begin_vowel + 7*duration_s/9 
               t_8 = begin_vowel + 8*duration_s/9 
               t_9 = begin_vowel + 9*duration_s/9 
                            
  select Pitch 'object_name$'
               f0_1 = Get value at time... 't_1' Hertz Linear
               f0_2 = Get value at time... 't_2' Hertz Linear
               f0_3 = Get value at time... 't_3' Hertz Linear
               f0_4 = Get value at time... 't_4' Hertz Linear
               f0_5 = Get value at time... 't_5' Hertz Linear
               f0_6 = Get value at time... 't_6' Hertz Linear
               f0_7 = Get value at time... 't_7' Hertz Linear
               f0_8 = Get value at time... 't_8' Hertz Linear
               f0_9 = Get value at time... 't_9' Hertz Linear
  fileappend "'directory$'f0-analysis.log" 'object_name$''tab$' 'b' 'tab$' 'interval_label$' 'tab$' 'f0_1:3' 'tab$' 'f0_2:3' 'tab$' 'f0_3:3' 'tab$' 'f0_4:3' 'tab$' 'f0_5:3' 'tab$' 'f0_6:3' 'tab$' 'f0_7:3' 'tab$' 'f0_8:3' 'tab$' 'f0_9:3' 'newline$'

select TextGrid 'object_name$'
  
  endif
     endfor

     #  By this point, we have gone through all the intervals for the current 
     #  textgrid, and written all the appropriate values to our log file.  We are now ready to go on to
     #  the next file, so we close can get rid of any objects we no longer need, and end our for loop

     select all
     minus Strings list
     Remove
endfor

# And at the end, a little bit of clean up and a message to let you know that it's all done.

select all
Remove
clearinfo
print All files have been processed.  What next?

## written by Katherine Crosswhite
## crosswhi@ling.rochester.edu
