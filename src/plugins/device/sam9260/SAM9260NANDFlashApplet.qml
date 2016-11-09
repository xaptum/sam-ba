/*
 * Copyright (c) 2015-2016, Atmel Corporation.
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms and conditions of the GNU General Public License,
 * version 2, as published by the Free Software Foundation.
 *
 * This program is distributed in the hope it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 */

import QtQuick 2.3
import SAMBA 3.1

/*! \internal */
Applet {
	name: "nandflash"
	description: "NAND Flash"
	codeUrl: Qt.resolvedUrl("applets/applet-nandflash-at91sam9260.bin")
	codeAddr: 0x20000000
	mailboxAddr: 0x20000004
	commands: [
		AppletCommand { name:"legacyInitialize"; code:0 },
		AppletCommand { name:"legacyEraseAll"; code:1 },
		AppletCommand { name:"legacyWriteBuffer"; code:2 },
		AppletCommand { name:"legacyReadBuffer"; code:3 }
	]
	trimPadding: true
	pageSize: 0x800
	eraseSupport: 0x20000

	/* -------- Command Line Handling -------- */

	/*! \internal */
	function commandLineParse(device, args)	{
		if (args.length === 0)
			return true
		else
			return "Invalid number of arguments."
	}

	/*! \internal */
	function commandLineHelp() {
		return ["Syntax: nandflash", "Parameters: none"]
	}
}
