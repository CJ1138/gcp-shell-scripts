#!/usr/bin/bash
#      _          _      _       _                            _            _     
#  ___| |__  _ __(_)___ (_) ___ | |__  _ __  ___  ___  _ __  | |_ ___  ___| |__  
# / __| '_ \| '__| / __|| |/ _ \| '_ \| '_ \/ __|/ _ \| '_ \ | __/ _ \/ __| '_ \ 
#| (__| | | | |  | \__ \| | (_) | | | | | | \__ \ (_) | | | || ||  __/ (__| | | |
# \___|_| |_|_|  |_|___// |\___/|_| |_|_| |_|___/\___/|_| |_(_)__\___|\___|_| |_|
#                     |__/                                                      
#
# Creates a public Google Cloud Storage bucket 

set -euo pipefail

project=$(gcloud config get-value project)

gsutil mb gs://$1


gsutil iam ch allUsers:objectViewer gs://$1
echo "Bucket created sucessfully in project $project!"
echo "Public URL: https://storage.googleapis.com/$1"
