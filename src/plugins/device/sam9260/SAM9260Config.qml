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

/*!
	\qmltype SAM9260Config
	\inqmlmodule SAMBA.Device.SAM9260
	\brief Contains configuration values for a SAM9260 device.

	By default, no configuration values are set.
*/
Item {
	/*! External RAM voltage: 1.8V = 0 / 3.3V = 1 */
	property var extramVdd

	/*! External RAM type: SDRAM = 0 / DDRAM = 1 */
	property var extramType

	/*! External RAM bus width: 16 / 32 */
	property var extramBusWidth

	/*! Dataflash index */
	property var dataflashIndex

	/*! Serialflash index */
	property var serialflashIndex
}
