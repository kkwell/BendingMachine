TEMPLATE = lib
CONFIG += plugin
QT += qml

DESTDIR = ./#imports/Pages
TARGET  = qmainpageplugin

SOURCES += plugin.cpp

pluginfiles.files += \
    plugins.qml \
    export/Pages/Mainpage.qml \
    export/Programpages/qmldir \
    export/Pages/qmldir \

qml.files = plugins.qml
qml.path += export/Pages
target.path += export/Pages
pluginfiles.path += export/Pages

MOC_DIR = tmp
RCC_DIR = tmp
UI_DIR = tmp
OBJECTS_DIR = tmp

INSTALLS += target qml pluginfiles

CONFIG += install_ok  # Do not cargo-cult this!

DISTFILES += \
    plugins.qml \

RESOURCES += \
    mainimages.qrc

#target.path = /mnt/hgfs/BendingMachine/Mainpage/export/Pages
#INSTALLS += target
