#!/bin/bash

DATE=`eval date +%Y`-`eval date +%m`-`eval date +%d`-`eval date +%H`-`eval date +%M`
if [[ ! -z $1 ]]; then
	PACKAGENAME=AnyKernel-$DATE-bacon-$1
else
	PACKAGENAME=AnyKernel-$DATE-bacon
fi

if [ -f ./bacon_defconfig-bin/zImage ]; then

	cp -fr ./bacon_defconfig-bin/zImage ./
	cp -fr ./bacon_defconfig-bin/zImage-dtb ./

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

	echo "cleanup"
	rm -rf zImage
	rm -rf zImage-dtb
else
	echo "zImage does not exits"
	exit 1
fi
