#!/bin/bash

nice -n 19 ionice -c2 -n7 rsync -r -p -g -o --delete --progress --ignore-existing rsync://10.10.10.50/RSYNC_WEB/ /opt/RSYNC_MIRROR
