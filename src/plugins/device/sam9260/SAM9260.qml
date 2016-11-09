/*
 * Copyright (c) 2016, Atmel Corporation.
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
import SAMBA.Device.SAM9260 3.1

/*!
	\qmltype SAM9260
	\inqmlmodule SAMBA.Device.SAM9260
	\brief Contains chip-specific information about SAM9260 device.

	This QML type contains configuration, applets and tools for supporting
	the SAM9260 device.
*/
Device {
	name: "sam9260"

	aliases: [ "sam9260" ]

	description: "SAM9260"

	boards: [ "sam9260-ek" ]

	/*!
		\brief The device configuration used by applets (peripherals, I/O sets, etc.)
		\sa SAM9260Config
	*/
	property alias config: config

	applets: [
		SAM9260LowlevelApplet { },
		SAM9260ExtRamApplet { },
		SAM9260DataFlashApplet { },
		SAM9260NANDFlashApplet { },
		SAM9260SerialFlashApplet { }
	]

	/*!
		\brief Initialize the SAM9260 device using the given \a connection.

		This method calls checkDeviceID.
	*/
	function initialize(connection) {
		checkDeviceID(connection)
	}

	/*!
		\brief Checks that the device is a SAM9260.

		Reads CHIPID_CIDR register using the given \a connection and display
		a warning if its value does not match the expected value for SAM9260.
	*/
	function checkDeviceID(connection) {
		// read CHIPID_CIDR register
		var cidr = connection.readu32(0xfffff240)
		// Compare cidr using mask to skip revision field.
		// The right part of the expression is masked in order to be converted
		// to a signed integer like the left part (thanks javascript...)
		if ((cidr & 0xffffffe0) !== (0x019803a0 & 0xffffffe0))
			print("Warning: Invalid CIDR (" +
			      Utils.hex(cidr) + "), no known SAM9260 chip detected!")
	}

	onBoardChanged: {
		if (board === "" || typeof board === "undefined") {
			config.extramVdd = undefined
			config.extramType = undefined
			config.extramBusWidth = undefined
			config.dataflashIndex = undefined
			config.serialflashIndex = undefined
		}
		else if (board === "sam9260-ek") {
			config.extramVdd = 1
			config.extramType = 0
			config.extramBusWidth = 32
			config.dataflashIndex = 1
			config.serialflashIndex = 0
		}
		else {
			var invalidBoard = board
			board = undefined
			throw new Error("Unknown SAM9260 board '" + invalidBoard + "'")
		}
	}

	SAM9260Config {
		id: config
	}
}
