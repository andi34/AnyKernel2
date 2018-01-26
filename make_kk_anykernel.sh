#!/bin/bash

DATE=`eval date +%Y`-`eval date +%m`-`eval date +%d`-`eval date +%H`-`eval date +%M`

if [[ ! -z $1 ]]; then
	PACKAGENAME=AnyKernel-$DATE-KitKat-espresso-$1
else
	PACKAGENAME=AnyKernel-$DATE-KitKat-espresso
fi

if [ -f $PACKAGENAME.zip ]; then
	echo "$PACKAGENAME exist already... skipping."
else
	zip -r $PACKAGENAME.zip META-INF/ modules/ tools/ anykernel.sh zImage
fi
