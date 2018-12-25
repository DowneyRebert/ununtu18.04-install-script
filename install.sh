#!/bin/sh
USER=$(whoami)

if [ "$USER" != "root" ]
	then
		echo "Permission denied!"
		exit 1
fi
/bin/bash aptsources.sh
/bin/bash sublime.sh
