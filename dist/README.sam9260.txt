SAM-BA 3.x support for SAM9260
------------------------------

# Overview

This branch contains modified sources of the Atmel SAM-BA tool in order to
support SAM9260 devices.

No QML examples are provided, it is recommended to use command line for this
target.

This implementation uses applets from SAM-BA 2.16.  Please see SAM-BA 2.16
package for applet sources.

# Running

## Configure device clocks and external RAM

The following applets must be loaded after each device reset. They will setup
the device clocks and external memory that are required for other applets.

sam-ba -p usb -b sam9260-ek -a lowlevel
sam-ba -p usb -b sam9260-ek -a extram

## Use NAND Flash applet

sam-ba -p usb -b sam9260-ek -a nandflash -c fullerase
sam-ba -p usb -b sam9260-ek -a nandflash -c writeboot:bootstrap.bin
sam-ba -p usb -b sam9260-ek -a nandflash -c verifyboot:bootstrap.bin
sam-ba -p usb -b sam9260-ek -a nandflash -c write:0x1234:otherfile.bin
sam-ba -p usb -b sam9260-ek -a nandflash -c verify:0x1234:otherfile.bin

## Use Data Flash applet:

sam-ba -p usb -b sam9260-ek -a dataflash -c fullerase
sam-ba -p usb -b sam9260-ek -a dataflash -c writeboot:bootstrap.bin
sam-ba -p usb -b sam9260-ek -a dataflash -c verifyboot:bootstrap.bin
sam-ba -p usb -b sam9260-ek -a dataflash -c write:0x1234:otherfile.bin
sam-ba -p usb -b sam9260-ek -a dataflash -c verify:0x1234:otherfile.bin

Board default for dataflash is SPI0/NPCS1. To use SPI0/NPCS0, replace
"dataflash" by "dataflash:0" in the previous commands.

## Use Serial Flash applet:

sam-ba -p usb -b sam9260-ek -a dataflash -c fullerase
sam-ba -p usb -b sam9260-ek -a dataflash -c writeboot:bootstrap.bin
sam-ba -p usb -b sam9260-ek -a dataflash -c verifyboot:bootstrap.bin
sam-ba -p usb -b sam9260-ek -a dataflash -c write:0x1234:otherfile.bin
sam-ba -p usb -b sam9260-ek -a dataflash -c verify:0x1234:otherfile.bin

Board default for serialflash is SPI0/NPCS0. To use SPI0/NPCS1, replace
"serialflash" by "serialflash:1" in the previous commands.

# Flashing Linux4SAM demos

The following commands will flash the Linux4SAM demo on a SAM9260-EK board.
The demo can be downloaded from: ftp://www.at91.com/pub/demo/linux4sam_2.0/

## NAND Flash

sam-ba -p usb -b sam9260-ek -a lowlevel
sam-ba -p usb -b sam9260-ek -a extram
sam-ba -p usb -b sam9260-ek -a nandflash -c fullerase
sam-ba -p usb -b sam9260-ek -a nandflash -c writeboot:nandflash_at91sam9260ek.bin
sam-ba -p usb -b sam9260-ek -a nandflash -c write:u-boot-1.3.4-exp.4-at91sam9260ek-nandflash.bin:0x20000
sam-ba -p usb -b sam9260-ek -a nandflash -c write:ubootEnvtFileNandFlash.bin:0x60000
sam-ba -p usb -b sam9260-ek -a nandflash -c write:uImage-2.6.30-r1-at91sam9260ek.bin:0x200000
sam-ba -p usb -b sam9260-ek -a nandflash -c write:Angstrom-console-at91sam9-image-glibc-ipk-2009.X-stable-at91sam9260ek.rootfs.jffs2:0x400000

## Data Flash

sam-ba -p usb -b sam9260-ek -a lowlevel
sam-ba -p usb -b sam9260-ek -a extram
sam-ba -p usb -b sam9260-ek -a dataflash -c fullerase
sam-ba -p usb -b sam9260-ek -a dataflash -c writeboot:dataflash_at91sam9260ek.bin
sam-ba -p usb -b sam9260-ek -a dataflash -c write:u-boot-1.3.4-exp.4-at91sam9260ek-dataflash_cs1.bin:0x00008400
sam-ba -p usb -b sam9260-ek -a dataflash -c write:ubootEnvtFileDataFlash.bin:0x00004200
sam-ba -p usb -b sam9260-ek -a dataflash -c write:uImage-2.6.30-r1-at91sam9260ek.bin:0x00042000
sam-ba -p usb -b sam9260-ek -a nandflash -c fullerase
sam-ba -p usb -b sam9260-ek -a nandflash -c write:Angstrom-console-at91sam9-image-glibc-ipk-2009.X-stable-at91sam9260ek.rootfs.jffs2:0x00400000

