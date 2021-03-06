#!/bin/bash
source SETTINGS.env
export local_dir=$DOCBAO_BASE_DIR
export PYTHONPATH=$PYTHONPATH:$local_dir

echo "Start running docbao_crawler"
cd $local_dir

# start crawl
cd $local_dir/src/backend
$local_dir/docbao_env/bin/python3 crawl.py

# copy json data to frontend
cp -r $local_dir/src/backend/export/* $local_dir/src/frontend/export/

# release temp & lock
rm $local_dir/backend/docbao.lock
killall -9 firefox
killall geckodriver
echo "stop docbao"

