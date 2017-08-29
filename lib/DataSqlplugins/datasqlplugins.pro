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
    imports/Dataplugins/Main.qml \
    imports/Dataplugins/Datalist/Data.qml \
    imports/Dataplugins/Datalist/Datalist.qml \
    imports/Dataplugins/Datalist/ListViewLoader.qml \
    imports/Dataplugins/Datastep/Datastep.qml \
    imports/Dataplugins/Datastep/Datasteplist.qml \
    imports/Dataplugins/Mouldlist/Mouldpage.qml \
    imports/Dataplugins/StartBending/StartBending.qml

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
    imports/Dataplugins/png.qrc \
    imports/Dataplugins/qml.qrc
