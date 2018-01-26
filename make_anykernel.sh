#!/bin/bash

DATE=`eval date +%Y`-`eval date +%m`-`eval date +%d`-`eval date +%H`-`eval date +%M`

if [ -f ./tmp/anykernel.sh ]; then
	cp -fr ./tmp/anykernel.sh ./anykernel.sh
fi

if [[ ! -z $1 ]]; then
	PACKAGENAME=AnyKernel-$DATE-tuna-$1
else
	PACKAGENAME=AnyKernel-$DATE-tuna
fi

if [ -f $PACKAGENAME.zip ]; then
	echo "$PACKAGENAME exist already... skipping."
else
	zip -r $PACKAGENAME.zip META-INF/ modules/ tools/ anykernel.sh zImage
fi

if [ -f ./anykernel.sh ]; then
	echo "cleanup"
	rm -rf ./anykernel.sh
fi
