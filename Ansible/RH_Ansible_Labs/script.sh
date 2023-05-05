#!/bin/bash

# Define the directory to search and the files to modify
directory="."
files="$directory/*"

# Loop over each file in the directory
for file in $files; do
  # Use sed to substitute the desired strings
  sed -i 's/host01/host01/g' "$file"
  sed -i 's/host02/host02/g' "$file"
  sed -i 's/host03/host03/g' "$file"
  sed -i 's/master01/master01/g' "$file"
done

