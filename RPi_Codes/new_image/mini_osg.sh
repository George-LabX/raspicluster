#!/bin/bash

# 1 = Drug, i.e. "Coc"
# 2 = Cohort, i.e. "C24"
# 3 = Session, i.e. "LGA05"

if [[ "$3" =~ ^SHOCK[0-9]{2}$ ]]; then

    scp -r /media/george/Expansion/RPi_Videos_B/$1_B/$2_$1_B/$3 jarryd.ramborger@ap40.uw.osg-htc.org:/home/jarryd.ramborger/videos/$1/row_$3/$2/$3
    
else


    scp -r /media/george/Expansion/RPi_Videos_B/$1_B/$2_$1_B/$3 jarryd.ramborger@ap40.uw.osg-htc.org:/home/jarryd.ramborger/videos/$1/row_B/$2/$3

fi

