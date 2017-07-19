TEMPLATE = app
TARGET = BendingMachine
QT += quick quickcontrols2\
      qml quick\
      core \
      charts

CONFIG += c++11

SOURCES += \
           $$PWD/cpp/main.cpp

MOC_DIR = tmp
RCC_DIR = tmp
UI_DIR = tmp
OBJECTS_DIR = tmp

#DEFINES += RASPBERRY
include( $$PWD/lib/MaterialUI/MaterialUI.pri )
#include( $$PWD/lib/Programpage/programpageplugin.pri )

INCLUDEPATH += \
               $$PWD/cpp/

RESOURCES += \
    $$PWD/qml/qml.qrc \
    resources/png/png.qrc

QML_IMPORT_PATH += $$PWD/lib/DataSqlplugins/imports/Dataplugins \
                   $$PWD/lib/Startplugins/imports/Startplugins
                   #$$PWD/../../DrawdesignsPage/export/Drawdesignspages\
                   #$$PWD/../../Mouldpage/export/Mouldpages
                   #/lib/qmllib/TimeExample

#LIBS += -L QML_IMPORT_PATH

target.path += $$PWD/
#target.path += /mnt/hgfs/BendingMachine/
INSTALLS += target
