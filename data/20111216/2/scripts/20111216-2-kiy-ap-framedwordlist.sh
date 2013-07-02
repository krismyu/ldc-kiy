# Time-stamp: <2013-05-09 23:34:21 amoebe>


############################## CODE SNIPPET 0 ##########################################
###### Processing raw audio files for 20111216-2-kiy-ap ################################

# Change the current directory to the directory with the raw wav files
cd ~/fkiy/ldc-kiy/kiy/20111216/2/data

# Get information about the raw sound file

sox --i 20111216-2-kiy-ap-framedwordlist1.wav

# Input File     : '20111216-2-kiy-ap-framedwordlist1.wav'
# Channels       : 2 # Ch 1: consultant; Ch 2: elicitor/translator
# Sample Rate    : 16000 # 16kHz sampling rate
# Precision      : 16-bit # 16 bit precision
# Duration       : 00:04:51.31 = 4660885 samples ~ 21847.9 CDDA sectors
# File Size      : 18.6M
# Bit Rate       : 512k
# Sample Encoding: 16-bit Signed Integer PCM

sox --i 20111216-2-kiy-ap-framedwordlist2.wav

Input File     : '20111216-2-kiy-ap-framedwordlist2.wav'
Channels       : 2 # Ch 1: consultant; Ch 2: elicitor/translator
Sample Rate    : 16000 # 16kHz sampling rate
Precision      : 16-bit # 16 bit precision
Duration       : 00:03:30.17 = 3362731 samples ~ 15762.8 CDDA sectors
File Size      : 13.5M
Bit Rate       : 512k
Sample Encoding: 16-bit Signed Integer PCM 

### Write raw 2-channel files to new file with "-stereo" suffix
mv 20111216-2-kiy-ap-framedwordlist1.wav 20111216-2-kiy-ap-framedwordlist1-stereo.wav
mv 20111216-2-kiy-ap-framedwordlist2.wav 20111216-2-kiy-ap-framedwordlist2-stereo.wav

### Channel 1 extraction from raw stereo files

sox 20111216-2-kiy-ap-framedwordlist1-stereo.wav -c 1 20111216-2-kiy-ap-framedwordlist1.wav  remix 1 0
sox 20111216-2-kiy-ap-framedwordlist2-stereo.wav -c 1 20111216-2-kiy-ap-framedwordlist2.wav  remix 1 0

########################################################################################


############################## CODE SNIPPET 1 ##########################################
### LABELING 20111216-2-kiy-ap-framedwordlist{1,2}.TextGrid2 ################################

cd ~/fkiy/ldc-kiy/kiy/20111216/2/info/ # Change directory to the one with hash tables

# For 20111216-2-kiy-ap-framedwordlist{1,2}, set intervals for each repetition for each item. Unlike 20111215-2-kiy-ap-framedwordlist{1,2}, no initial tier setting intervals for each individual item (including both reps) as well

sed -n 101,150p labels.tmp > labels1.tmp # Extract labels for Session 3 of 20111215-2-kiy-ap-framedwordlist.
sed -n 151,200p labels.tmp > labels2.tmp # Extract labels for Session 4 of 20111215-2-kiy-ap-framedwordlist.

# labels1.tmp used to create labels in Tier 1 for 20111216-2-kiy-ap-framedwordlist1.TextGrid2
# labels2.tmp used to create labels in Tier 1 for 20111216-2-kiy-ap-framedwordlist12TextGrid2

########################################################################################

