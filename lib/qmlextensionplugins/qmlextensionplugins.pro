TEMPLATE = lib
CONFIG += plugin
QT += qml

DESTDIR = imports/TimeExample
TARGET  = qmlqtimeexampleplugin

SOURCES += plugin.cpp

pluginfiles.files += \
    imports/TimeExample/qmldir \
    imports/TimeExample/center.png \
    imports/TimeExample/clock.png \
    imports/TimeExample/Clock.qml \
    imports/TimeExample/hour.png \
    imports/TimeExample/minute.png

#qml.files = plugins.qml
#qml.path += $$[QT_INSTALL_EXAMPLES]/qml/qmlextensionplugins
#target.path += $$[QT_INSTALL_EXAMPLES]/qml/qmlextensionplugins/imports/TimeExample
#pluginfiles.path += $$[QT_INSTALL_EXAMPLES]/qml/qmlextensionplugins/imports/TimeExample

qml.files = plugins.qml
qml.path += $$PWD/
target.path += $$PWD/imports/TimeExample
pluginfiles.path += $$PWD/imports/TimeExample

MOC_DIR = tmp
RCC_DIR = tmp
UI_DIR = tmp
OBJECTS_DIR = tmp

INSTALLS += target qml pluginfiles

CONFIG += install_ok  # Do not cargo-cult this!
