TEMPLATE = lib
CONFIG += plugin
QT += qml\
      sql

DESTDIR = export/Programpages
TARGET  = qprogrampageplugin

SOURCES += \
    cpp/plugin.cpp

pluginfiles.files += \
    export/Programpages/Programpage.qml \
    export/Programpages/Mqsql.qml \
    export/Programpages/qmldir


qml.files = plugins.qml
qml.path += $$PWD/
target.path += $$PWD/export/Programpages
pluginfiles.path += $$PWD/export/Programpages

MOC_DIR = tmp
RCC_DIR = tmp
UI_DIR = tmp
OBJECTS_DIR = tmp

INSTALLS += target qml pluginfiles

CONFIG += install_ok  # Do not cargo-cult this!



