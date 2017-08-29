TEMPLATE = lib
CONFIG += plugin
QT += qml quick

DESTDIR = imports/Keyboardplugins
TARGET  = keyboardplugins

HEADERS += \
    cpp/mykeyboard.h
SOURCES += \
    cpp/plugin.cpp \
    cpp/mykeyboard.cpp

pluginfiles.files += \
    imports/Keyboardplugins/qmldir \
    imports/Keyboardplugins/Keyboard.qml \
    imports/Keyboardplugins/KeyButton.qml \
    imports/Keyboardplugins/KeyModel.qml \
    imports/Keyboardplugins/KeyPopup.qml \
    imports/Keyboardplugins/MyStyles.qml \

qml.files = plugins.qml
qml.path += $$PWD/
target.path += $$PWD/imports/Keyboardplugins
pluginfiles.path += $$PWD/imports/Keyboardplugins

MOC_DIR = tmp
RCC_DIR = tmp
UI_DIR = tmp
OBJECTS_DIR = tmp

INSTALLS += target qml pluginfiles

CONFIG += install_ok  # Do not cargo-cult this!

RESOURCES += \
    imports/Keyboardplugins/png.qrc

#DISTFILES += \
#    imports/Startplugins/StartingBending.qml
