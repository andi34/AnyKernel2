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
device.name1=maguro
device.name2=toro
device.name3=toroplus
device.name4=tuna
device.name5=
} # end properties

# shell variables
block=/dev/block/platform/omap/omap_hsmmc.0/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;

# Alert of unsupported Android version
android_ver=$(file_getprop /system/build.prop "ro.build.version.release");
case "$android_ver" in
  "4.4.4") support_status="supported";;
  *) support_status="unsupported";;
esac;
ui_print "Running Android $android_ver..."
ui_print "This kernel is $support_status for this version!";


## AnyKernel install
dump_boot;

# begin ramdisk changes
backup_file init.omap4.rc;
insert_line init.omap4.rc "omaplfb.ko" before "insmod /system/lib/modules/pvrsrvkm.ko" "    insmod /system/lib/modules/omaplfb.ko";

# end ramdisk changes

write_boot;

## end install

