#!/bin/bash
# This code is to transfer video files form a Mini PC to the Super PC.
# It depends largely on your structure of directories and paths in your user profile.
# It takes in 3 arguments as follows:

# 1 = Drug, i.e. "Coc"
# 2 = Cohort, i.e. "C24"
# 3 = Session, i.e. "LGA05"

if [[ "$3" =~ ^SHOCK[0-9]{2}$ ]]; then

    scp -r /media/george/Expansion/RPi_Videos_B/$1_B/$2_$1_B/$3 USER.NAME@ap40.uw.osg-htc.org:/home/USER.NAME/videos/$1/row_$3/$2/$3
    
else


    scp -r /media/george/Expansion/RPi_Videos_B/$1_B/$2_$1_B/$3 USER.NAME@ap40.uw.osg-htc.org:/USER.NAME/videos/$1/row_B/$2/$3

fi

