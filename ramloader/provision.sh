./sam-ba -x ldr-write-identity.qml
turnoffstr="0942x00"
echo "${turnoffstr/x/$1}" > /dev/ttyACM0 # reboot card
./sam-ba -x ldr-usb-ram.qml
