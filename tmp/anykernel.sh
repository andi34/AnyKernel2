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


## Alert of unsupported Android version
android_ver=$(mount /system; grep "^ro.build.version.release" /system/build.prop | cut -d= -f2; umount /system);
case "$android_ver" in
  "5.0.0"|"5.0.1"|"5.0.2"|"5.1.0"|"5.1.1"|"6.0.0"|"6.0.1"|"7.1.1"|"7.1.2") support_status="supported";;
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

