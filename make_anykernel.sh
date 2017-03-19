#!/bin/bash

DATE=`eval date +%Y`-`eval date +%m`-`eval date +%d`
PACKAGENAME=AnyKernel-$DATE-tuna

if [ -f $PACKAGENAME.zip ]; then
	echo "$PACKAGENAME exist already... skipping."
else
	zip -r $PACKAGENAME.zip META-INF/ modules/ tools/ anykernel.sh zImage
fi
