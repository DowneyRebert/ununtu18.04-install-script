#!/bin/bash
APTSRC_FILE=aptsources.tsinghua

echo "staring aptsources installation..."

cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp $APTSRC_FILE /etc/apt/sources.list
apt update

echo "aptsources installation is complete!"
