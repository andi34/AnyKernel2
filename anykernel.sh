# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=Android-Andi @ xda-developers
do.devicecheck=1
do.modules=1
do.cleanup=0
do.cleanuponabort=0
device.name1=espresso
device.name2=espresso3g
device.name3=espresso-common
device.name4=espressowifi
device.name5=p3100
device.name6=p3110
device.name7=p3113
device.name8=p5100
device.name9=p5110
device.name10=p5113
device.name11=espressowifixx
device.name12=espresso10wifixx
device.name13=espressorf
device.name14=espressorfxx
device.name15=espresso10rf
device.name16=espresso10rfxx
} # end properties

# shell variables
block=/dev/block/platform/omap/omap_hsmmc.1/by-name/KERNEL;
is_slot_device=0;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel install
dump_boot;

write_boot;

## end install

