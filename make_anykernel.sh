#!/bin/bash

DATE=`eval date +%Y`-`eval date +%m`-`eval date +%d`-`eval date +%H`-`eval date +%M`
PACKAGENAME=AnyKernel-$DATE-bacon

if [ -f $PACKAGENAME.zip ]; then
	echo "$PACKAGENAME exist already... skipping."
else
	zip -r $PACKAGENAME.zip META-INF/ tools/ anykernel.sh zImage
fi
