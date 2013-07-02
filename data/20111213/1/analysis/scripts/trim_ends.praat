clearinfo
# Select all
# Remove
form Files
	sentence Directory /Users/amoebe/ldc/data/20111208/6/data/tokens/
	sentence Save_directory /Users/amoebe/ldc/data/20111208/6/data/trimmed/
	real Start 0.0
	word In_base_name 
	word Out_base_name 
endform

Create Strings as file list...  list 'directory$''in_base_name$'*.wav
number_files = Get number of strings

for i from 1 to number_files
	select Strings list
	current_file$=Get string... 'i'
	printline 'current_file$'	
	Read from file... 'directory$''current_file$'
	base_name$ = current_file$ - ".wav"
	out_name$ = base_name$ + out_base_name$ 
	select Sound 'base_name$'
	Edit
		editor Sound 'base_name$'
		pause Select left boundary and move to nearest zero crossing
#		Move cursor to nearest zero crossing
		left = Get cursor
		pause Select right boundary and move to nearest zero crossing
#		Move cursor to nearest zero crossing
		right = Get cursor
		Select... 'left' 'right'
		pause All set!
		Write sound selection to WAV file... 'save_directory$''out_name$'.wav
		Close
	endeditor
	select Strings list
endfor
