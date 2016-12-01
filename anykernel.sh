# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# EDIFY properties
kernel.string=Android-Andi @ xda-developers
do.devicecheck=1
do.initd=0
do.modules=1
do.cleanup=0
device.name1=maguro
device.name2=toro
device.name3=toroplus
device.name4=tuna
device.name5=

# shell variables
block=/dev/block/platform/omap/omap_hsmmc.0/by-name/boot;
is_slot_device=0;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel install
dump_boot;

write_boot;

## end install

