# Time-stamp: <2013-06-18 11:36:43 amoebe>


cd ~/ldc/data/20111207/2/info
cut -f1 20111207-2-kiy-ap-wordlist.txt > numeric-labels.txt
cut -f2 20111207-2-kiy-ap-wordlist.txt > kiy-labels.txt

############################## CODE SNIPPET 0 ##########################################
###### Processing raw audio files for 201112107-1-kiy-ap ################################

# Change the current directory to the directory with the raw wav files
cd ~/fkiy/ldc-kiy/kiy/20111207/1/data

# Get information about the raw sound file

sox --i 20111207-1-kiy-ap-wordlist.wav

# Input File     : '20111207-1-kiy-ap-wordlist.wav'
# Channels       : 1
# Sample Rate    : 16000
# Precision      : 16-bit
# Duration       : 00:08:42.13 = 8354083 samples ~ 39159.8 CDDA sectors
# File Size      : 16.7M
# Bit Rate       : 256k
# Sample Encoding: 16-bit Signed Integer PCM

########################################################################################


