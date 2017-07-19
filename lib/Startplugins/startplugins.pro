TEMPLATE = lib
CONFIG += plugin
QT += qml

DESTDIR = imports/Startplugins
TARGET  = startplugins

HEADERS += \
    cpp/plugin.h
SOURCES += \
    cpp/plugin.cpp

pluginfiles.files += \
    imports/Startplugins/qmldir \
    imports/Startplugins/StartBending.qml

qml.files = plugins.qml
qml.path += $$PWD/
target.path += $$PWD/imports/Startplugins
pluginfiles.path += $$PWD/imports/Startplugins

MOC_DIR = tmp
RCC_DIR = tmp
UI_DIR = tmp
OBJECTS_DIR = tmp

INSTALLS += target qml pluginfiles

CONFIG += install_ok  # Do not cargo-cult this!

RESOURCES += \
    imports/Startplugins/png.qrc

#DISTFILES += \
#    imports/Startplugins/StartingBending.qml
