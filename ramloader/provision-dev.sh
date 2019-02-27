sudo ./tool/xaprc_eval_tool -s 1 boot romboot reboot
sleep 5
sudo chmod a+rw /dev/ttyACM0
./sam-ba -x ldr-write-identity.qml
sudo ./tool/xaprc_eval_tool -s 1 boot romboot reboot
sleep 5
sudo chmod a+rw /dev/ttyACM0
./sam-ba -x ldr-usb-ram.qml
