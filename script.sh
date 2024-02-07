#!/bin/bash

directory_path="/home/ubuntu/demo"

# Check if the directory exists
if [ ! -d "$directory_path" ]; then
    # Directory does not exist, create it
    mkdir -p "$directory_path"
    cd "$directory_path"
else
    cd "$directory_path"
fi