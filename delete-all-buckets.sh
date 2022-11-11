#!/usr/bin/bash
#      _          _      _       _                            _            _     
#  ___| |__  _ __(_)___ (_) ___ | |__  _ __  ___  ___  _ __  | |_ ___  ___| |__  
# / __| '_ \| '__| / __|| |/ _ \| '_ \| '_ \/ __|/ _ \| '_ \ | __/ _ \/ __| '_ \ 
#| (__| | | | |  | \__ \| | (_) | | | | | | \__ \ (_) | | | || ||  __/ (__| | | |
# \___|_| |_|_|  |_|___// |\___/|_| |_|_| |_|___/\___/|_| |_(_)__\___|\___|_| |_|
#                     |__/                                                      
#
# Deletes all GSC buckets in a GCP project

set -euo pipefail

ProjectId=$(gcloud config get-value project)

echo "You are about to delete all buckets in project ID: $ProjectId. Type YES to proceed:"
read confirmation

if [ $confirmation == "YES" ]
then
  count=0
  for x in `gsutil ls`
    do gsutil rm -r $x
    ((count=$count+1))
  done
  echo "$count buckets sucessfully deleted."
else
  echo "Aborted"
fi
