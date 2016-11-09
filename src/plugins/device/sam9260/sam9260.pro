TEMPLATE = aux

DEVICE = SAM9260

DEVICE_FILES *= \
    qmldir \
    SAM9260Config.qml \
    SAM9260.qml \
    SAM9260LowlevelApplet.qml \
    SAM9260ExtRamApplet.qml \
    SAM9260DataFlashApplet.qml \
    SAM9260NANDFlashApplet.qml \
    SAM9260SerialFlashApplet.qml \
    applets/README.txt \
    applets/applet-lowlevelinit-at91sam9260.bin \
    applets/applet-extram-at91sam9260.bin \
    applets/applet-dataflash-at91sam9260.bin \
    applets/applet-nandflash-at91sam9260.bin \
    applets/applet-serialflash-at91sam9260.bin

include(../device.pri)

metadata.files = device_sam9260.json
metadata.path = /metadata
INSTALLS *= metadata

OTHER_FILES += \
    $$DEVICE_FILES \
    module_samba_device_sam9260.qdoc
