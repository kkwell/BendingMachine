TEMPLATE = lib
CONFIG += plugin
QT += qml

DESTDIR = imports/Dataplugins
TARGET  = datasqlplugins

SOURCES += cpp/plugin.cpp

pluginfiles.files += \
    imports/Dataplugins/qmldir \
    imports/Dataplugins/Data.qml \
    imports/Dataplugins/Datalist.qml

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

DISTFILES += \
    imports/Dataplugins/Mqsql.qml

RESOURCES += \
    imports/Dataplugins/png.qrc
