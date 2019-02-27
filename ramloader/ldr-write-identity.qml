import SAMBA 3.2
import SAMBA.Connection.Serial 3.2
import SAMBA.Device.SAMA5D2 3.2

SerialConnection {
	//Define offsets
	property int ram:            0x20000000;
	property int sram:           0x00200000;
	property int start_uboot:    0x06f00000;
	property int start_dtb:      0x01000000;
	property int start_kernel:   0x02000000;
	property int start_identity: 0x40000000;
	device: SAMA5D2Xplained {
	}

	onConnectionOpened: {
		// Write the identity partition to MMC
		console.log("Writing identity image to MMC at 0x", start_identity.toString(16))
		initializeApplet("sdmmc")
		applet.write(0x40000000, "images/identity.custom.ext2", false)	
	}
}
