#!/bin/bash

DATE=`eval date +%Y`-`eval date +%m`-`eval date +%d`-`eval date +%H`-`eval date +%M`
if [[ ! -z $1 ]]; then
	PACKAGENAME=AnyKernel-$DATE-golden-$1
else
	PACKAGENAME=AnyKernel-$DATE-golden
fi

if [ -f ./blackhawk_golden_defconfig-bin/zImage ]; then

	cp -fr ./blackhawk_golden_defconfig-bin/zImage ./
	cp -fr ./blackhawk_golden_defconfig-bin/modules ./

	if [[ ! -z $1 ]]; then
		PACKAGENAME=AnyKernel-$DATE-golden-$1
	else
		PACKAGENAME=AnyKernel-$DATE-golden
	fi

	if [ -f $PACKAGENAME.zip ]; then
	echo "$PACKAGENAME exist already... skipping."
	else
		zip -r $PACKAGENAME.zip META-INF/ modules/ tools/ anykernel.sh zImage
	fi

	echo "cleanup"
	rm -rf modules
	rm -rf zImage
else
	echo "zImage does not exits"
	exit 1
fi
