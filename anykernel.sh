# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=DirtyV by bsmitty83 @ xda-developers
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=bacon
device.name2=A0001
device.name3=
device.name4=
device.name5=
} # end properties

# shell variables
block=/dev/block/platform/msm_sdcc.1/by-name/boot;
is_slot_device=0;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel install
dump_boot;

write_boot;

## end install


