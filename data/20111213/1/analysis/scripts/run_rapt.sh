#!/bin/bash
# Time-stamp: <2013-06-19 08:24:59 amoebe>
# RUN_RAPT.SH
# PROJECT: LDC-KIY
# AUTHOR: krisyu@linguist.umass.edu
# PURPOSE: MASTER SCRIPT FOR CALLING F0 EXTRACTION ROUTINES

## Run f0 extraction with RAPT algorithm, with pitch range set by Pget_f0 to [50,350] Hz 
./calc_f0_rapt.sh ../../data/tokens ../../analysis/f0

# Aggregate f0 extraction data
python proc_esps_files.py ../f0 ../f0

# Get timestamps for W1 and W2 from textgrid
./get_timestamps.sh ../../data/tokens ../../analysis/f0

