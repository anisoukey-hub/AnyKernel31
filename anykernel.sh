### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=Custom Kernel for OnePlus Ace 5 Pro
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
# 请将这里的 device.name1 替换为你的 LineageOS 中一加 Ace 5 Pro 的实际设备代号 (可通过 getprop ro.product.device 查看)
device.name1=ace5pro
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


### AnyKernel install
## boot files attributes
boot_attributes() {
set_perm_recursive 0 0 755 644 $RAMDISK/*;
set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
} # end attributes

# boot shell variables
# 高通机型的通用 boot 分区路径，或者直接填 BLOCK=boot;
BLOCK=/dev/block/bootdevice/by-name/boot;
# 一加 Ace 5 Pro 采用 A/B 虚拟分区，必须改为 1
IS_SLOT_DEVICE=1;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
# 对于含有 init_boot 分区的设备，使用 split_boot 跳过 Ramdisk 解包
split_boot; 

# （已删除原脚本中针对 tuna 的 init.rc 和 fstab 修改代码，因为现代设备不需要这些）

# 使用 flash_boot 跳过 Ramdisk 重新打包，直接刷入内核
flash_boot; 
## end boot install
