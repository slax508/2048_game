#!/bin/bash

# Initialize a new git repository
git init

# Add all files to the staging area
git add .

# Commit the changes with a message
git commit -m "Initial commit"

# Set the remote repository (replace with your repository URL)
git remote add origin https://github.com/slax508/2048_game.git

# Push the changes to the remote repository
git branch -M main
git push -u origin main