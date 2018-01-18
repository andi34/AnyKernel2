#!/bin/bash

DATE=`eval date +%Y`-`eval date +%m`-`eval date +%d`-`eval date +%H`-`eval date +%M`
if [[ ! -z $1 ]]; then
	PACKAGENAME=AnyKernel-$DATE-bacon-$1
else
	PACKAGENAME=AnyKernel-$DATE-bacon
fi

if [ -f $PACKAGENAME.zip ]; then
	echo "$PACKAGENAME exist already... skipping."
else
	zip -r $PACKAGENAME.zip META-INF/ tools/ anykernel.sh zImage zImage-dtb
fi
