/*
 * Copyright (c) 2016-2017, Atmel Corporation.
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
import SAMBA 3.2

/*! \internal */
Applet {
	name: "usart"
	description: "USART app"

    commands: [
		AppletCommand { name:"initialize"; code:0 }
	]

	/* -------- Command Line Handling -------- */

	/*! \internal */
	function commandLineCommands() {
		return [ ]
	}

	/*! \internal */
	function commandLineCommandHelp(command) {
	}

	/*! \internal */
	function commandLineCommand(command, args) {
		return "Unknown command."
	}
}
