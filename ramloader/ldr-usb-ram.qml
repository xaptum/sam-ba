import SAMBA 3.2
import SAMBA.Connection.Serial 3.2
import SAMBA.Device.SAMA5D2 3.2

SerialConnection {
	//Define offsets
	property int ram:            0x20000000;
	property int sram:           0x00200000;
	property int mmc	   
	property int start_uboot:    0x06f00000;
	property int start_dtb:      0x01000000;
	property int start_kernel:   0x02000000;
	property int start_identity: 0x40000000;
	device: SAMA5D2Xplained {
	}

	onConnectionOpened: {
		//Write the provisioning script to RAM
		initializeApplet("ramloader")
		
		console.log(
			"---- Writing u-boot.bin at offset 0x", start_uboot.toString(16), 
			", dtb at offset 0x", start_dtb.toString(16), 
			", kernel at offset 0x", start_kernel.toString(16), 
			", RAM start addr 0x", ram.toString(16),
			"----");
				

		applet.write(ram + start_dtb, "images/at91-xaprc001.dtb", false)
		applet.write(ram + start_kernel, "images/zImage", false)
		applet.write(ram + start_uboot, "images/u-boot.bin", false)
		applet.write(sram, "images/at91bootstrap.bin", false)
		
		//Go to the beginning of the bootloader
		this.go(sram)
	}
}
