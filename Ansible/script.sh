#!/bin/bash

# Define the directory to search and the files to modify
directory="/root/DevOps_Labs/Ansible/RH_Ansible_Labs"
files="$directory/*"

# Loop over each file in the directory
for file in $files; do
  # Use sed to substitute the desired strings
  echo "$file\n"
  sed -i 's/node1/host01/g' "$file" ; echo "node1 done\n"
  sed -i 's/node2/host02/g' "$file"
  sed -i 's/node3/host03/g' "$file"
  sed -i 's/control/master01/g' "$file"
done

