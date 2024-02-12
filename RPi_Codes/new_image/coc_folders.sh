#!/bin/bash

cd /media/george/Expansion/RPi_Videos_B/Coc_B

# Create LGA directories
for i in {1..15}; do
  mkdir -p "LGA$(printf "%02d" $i)"
done

# Create SHA directories
for i in {1..10}; do
  mkdir -p "SHA$(printf "%02d" $i)"
done

# Create PR directories
for i in {1..3}; do
  mkdir -p "PR$(printf "%02d" $i)"
done

# Create SHOCK directories
for i in {1..4}; do
  mkdir -p "SHOCK$(printf "%02d" $i)"
done

# Create PRESHOCK directories
for i in {1..4}; do
  mkdir -p "PRESHOCK$(printf "%02d" $i)"
done

echo "Directories created successfully."


# Create LGA directories
for i in {1..15}; do
  mkdir -p "LGA$(printf "%02d" $i)"
done

# Create SHA directories
for i in {1..10}; do
  mkdir -p "SHA$(printf "%02d" $i)"
done

# Create PR directories
for i in {1..3}; do
  mkdir -p "PR$(printf "%02d" $i)"
done

# Create SHOCK directories
for i in {1..4}; do
  mkdir -p "SHOCK$(printf "%02d" $i)"
done

# Create PRESHOCK directories
for i in {1..4}; do
  mkdir -p "PRESHOCK$(printf "%02d" $i)"
done

echo "Directories created successfully."

