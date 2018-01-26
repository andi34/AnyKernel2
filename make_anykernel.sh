#!/bin/bash

DATE=`eval date +%Y`-`eval date +%m`-`eval date +%d`-`eval date +%H`-`eval date +%M`

if [ -f ./tuna_defconfig-bin/zImage ]; then

	cp -fr ./tuna_defconfig-bin/zImage ./
	cp -fr ./tuna_defconfig-bin/modules ./
	
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
		rm -rf modules
		rm -rf zImage
	fi
else
	echo "zImage does not exits"
	exit 1
fi
