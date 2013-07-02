#!/usr/bin/python
# PROC_ESPS_FILES.PY
# Time-stamp: <2011-04-29 14:24:50 amoebe>
# PROJECT: Cantonese tritone resolution f0 extraction
# PURPOSE: To take outfiles from get_f0 (ESPS/RAPT), append the filename and timestamp, and concatenate all the modified outfiles into an aggregate one.
# ARGS: Path where RAPT output/pplained output files are (ADDED 20110429), and Save path

# Inspired by http://bytes.com/topic/python/answers/21567-adding-column-tab-delimited-txt-file and http://bogdan.org.ua/2007/08/12/python-iterate-and-read-all-files-in-a-directory-folder.html

# import libraries for working with directories and files

import os
import glob
import sys 

pathLoad = sys.argv[1] # load path
pathSave = sys.argv[2] # save path

#path = '/Users/amoebe/diss/cant/perception/res_tri/analysis/out/rapt_extracted/range_spkr/quant-01-pm30per'
#path = '/Users/amoebe/diss/cant/perception/res_tri/analysis/out/rapt_extracted/range_60_500'

# Initialize list for all the concatenated files
espsData = []

###############################################
#### LOOP OVER EACH .F0.P FILE IN THE PATH ####
###############################################

for infile in glob.glob( os.path.join(pathLoad, '*.f0.p') ):

# split lines by tab delimiter
    rows = [line.split('\t') for line in file(infile)]

# generate t values, increment by framestep, scaled for rounding error. Convert from float value into string.

    ts = [float(t) * 0.01 / (220.50 / 221.0) for t in range(0, len(rows))]
    ts_str = [str(t) for t in ts]

# get basefilename, without file extension for naming file to write to
    base_infile =  os.path.splitext(os.path.basename(infile))[0]

# generate repeated filename list
    filenames = [base_infile for i in xrange(len(rows))]

# Transpose rows and append filenames and timestamps
    cols = zip(*rows) # transpose 2D list
    cols.insert(0,ts_str) # append timestamps
    cols.insert(0,filenames) # append filenames

    rows = zip(*cols) # transpose back

# Append to espsData, extend appends all list items rather than list itself
    espsData.extend(rows)    

# write to file

file(os.path.join(pathSave,'espsData.txt'), 'w').writelines(['\t'.join(row) for row in espsData])
