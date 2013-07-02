#!/bin/bash
# Time-stamp: <2013-06-18 12:10:20 amoebe>
# RUN_RAPT.SH
# PROJECT: LDC-KIY
# AUTHOR: krisyu@linguist.umass.edu
# PURPOSE: MASTER SCRIPT FOR CALLING F0 EXTRACTION ROUTINES ON 20111207-1 AND 2011207-2 DATA

## Run f0 extraction with RAPT algorithm, with pitch range set by Pget_f0 to [50,350] Hz 
./calc_f0_rapt.sh ../../data/trimmed ../../analysis/f0

# Aggregate f0 extraction data
python proc_esps_files.py ../f0 ../f0
