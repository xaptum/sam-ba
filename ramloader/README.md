QML Loading Apps
------------

# Overview

The scripts in these directories use sam-ba and a custom applet to load program data to the sama5d2

# Usage

Run a samba script by calling
sam-ba -x ldr-usb-ram.qml

This script will expect the files to be loaded from an images/ directory. This can easily be done by creating a symbolic link to the images/ directory on your desired xaptum-buildroot build. 
