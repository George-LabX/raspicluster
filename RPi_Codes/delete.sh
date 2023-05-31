# Can be put on all RPis as an executable code to delete videos from a specific session on one or all RPis

!/bin/bash

SESSION=$1
BOX=$BOX
DATE=$3

rm "${SESSION}_${BOX}_${DATE}.mp4"

# e.g. ./delete.sh LGA12 BOX 2023-05-23
