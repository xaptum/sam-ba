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
	name: "dataflash"
	description: "AT45 Data Flash"
	codeUrl: Qt.resolvedUrl("applets/applet-dataflash-at91sam9260.bin")
	codeAddr: 0x20000000
	mailboxAddr: 0x20000004
	commands: [
		AppletCommand { name:"legacyInitialize"; code:0 },
		AppletCommand { name:"legacyEraseAll"; code:1; timeout: 5*60000 },
		AppletCommand { name:"legacyWriteBuffer"; code:2 },
		AppletCommand { name:"legacyReadBuffer"; code:3 }
	]
	pageSize: 1056

	/*! \internal */
	function buildInitArgs(connection, device) {
		if (typeof device.config.dataflashIndex === "undefined")
			throw new Error("Incomplete configuration, missing value for dataflashIndex")

		var args = defaultInitArgs(connection, device)
		var config = [ device.config.dataflashIndex ]
		Array.prototype.push.apply(args, config)
		return args
	}

	/* -------- Command Line Handling -------- */

	/*! \internal */
	function commandLineParse(device, args)	{
		switch (args.length)
		{
		case 1:
			if (args[0].length > 0) {
				device.config.dataflashIndex = Utils.parseInteger(args[0]);
				if (isNaN(device.config.dataflashIndex))
					return "Invalid Dataflash index (not a number)."
			}
			// fall-through
		case 0:
			return true;
		default:
			return "Invalid number of arguments."
		}
	}

	/*! \internal */
	function commandLineHelp() {
		return ["Syntax: dataflash:[<idx>]",
		        "Parameters:",
		        "    idx          Dataflash index",
		        "Examples: ",
		        "    dataflash    use default board settings",
		        "    dataflash:1  use custom settings (SPI0 NPCS1)"]
	}
}
