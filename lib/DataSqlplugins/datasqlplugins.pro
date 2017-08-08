TEMPLATE = lib
CONFIG += plugin
QT += quick quickcontrols2 \
      qml \
      sql

DESTDIR = imports/Dataplugins
TARGET  = datasqlplugins

HEADERS += \
    cpp/plugin.h
SOURCES += \
    cpp/plugin.cpp

pluginfiles.files += \
    imports/Dataplugins/qmldir \
    imports/Dataplugins/Data.qml \
    imports/Dataplugins/Datalist.qml \
    imports/Dataplugins/Datastep.qml \
    imports/Dataplugins/Datasteplist.qml \
    imports/Dataplugins/ListViewLoader.qml \
    imports/Dataplugins/Mouldpage.qml

qml.files = plugins.qml
qml.path += $$PWD/
target.path += $$PWD/imports/Dataplugins
pluginfiles.path += $$PWD/imports/Dataplugins

MOC_DIR = tmp
RCC_DIR = tmp
UI_DIR = tmp
OBJECTS_DIR = tmp

INSTALLS += target qml pluginfiles

CONFIG += install_ok  # Do not cargo-cult this!

RESOURCES += \
    imports/Dataplugins/png.qrc
