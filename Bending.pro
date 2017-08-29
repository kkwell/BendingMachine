TEMPLATE = app
TARGET = BendingMachine
QT += quick quickcontrols2\
      qml quick\
      core \
      charts

CONFIG += c++11

HEADERS +=
#    cpp/bpiserial.h \
#    ../wiringPi/wiringPi/wiringPi.h \
#    ../wiringPi/wiringPi/wiringSerial.h \
#    ../wiringPi/wiringPi/ads1115.h \
#    ../wiringPi/wiringPi/bmp180.h \
#    ../wiringPi/wiringPi/drcSerial.h \
#    ../wiringPi/wiringPi/ds18b20.h \
#    ../wiringPi/wiringPi/htu21d.h \
#    ../wiringPi/wiringPi/max5322.h \
#    ../wiringPi/wiringPi/max31855.h \
#    ../wiringPi/wiringPi/mcp23s08.h \
#    ../wiringPi/wiringPi/mcp23s17.h \
#    ../wiringPi/wiringPi/mcp23x08.h \
#    ../wiringPi/wiringPi/mcp23x0817.h \
#    ../wiringPi/wiringPi/mcp3002.h \
#    ../wiringPi/wiringPi/mcp3004.h \
#    ../wiringPi/wiringPi/mcp3422.h \
#    ../wiringPi/wiringPi/mcp4802.h \
#    ../wiringPi/wiringPi/mcp23008.h \
#    ../wiringPi/wiringPi/mcp23016.h \
#    ../wiringPi/wiringPi/mcp23016reg.h \
#    ../wiringPi/wiringPi/mcp23017.h \
#    ../wiringPi/wiringPi/pcf8574.h \
#    ../wiringPi/wiringPi/pcf8591.h \
#    ../wiringPi/wiringPi/rht03.h \
#    ../wiringPi/wiringPi/sn3218.h \
#    ../wiringPi/wiringPi/softPwm.h \
#    ../wiringPi/wiringPi/softServo.h \
#    ../wiringPi/wiringPi/softTone.h \
#    ../wiringPi/wiringPi/sr595.h \
#    ../wiringPi/wiringPi/wiringPiI2C.h \
#    ../wiringPi/wiringPi/wiringPiSPI.h \
#    ../wiringPi/wiringPi/wiringShift.h

SOURCES += \
    cpp/main.cpp \
#    cpp/bpiserial.cpp \
#    ../wiringPi/wiringPi/wiringSerial.c \
#    ../wiringPi/wiringPi/wiringPi.c \
#    ../wiringPi/wiringPi/ads1115.c \
#    ../wiringPi/wiringPi/bmp180.c \
#    ../wiringPi/wiringPi/drcSerial.c \
#    ../wiringPi/wiringPi/ds18b20.c \
#    ../wiringPi/wiringPi/htu21d.c \
#    ../wiringPi/wiringPi/max5322.c \
#    ../wiringPi/wiringPi/max31855.c \
#    ../wiringPi/wiringPi/mcp23s08.c \
#    ../wiringPi/wiringPi/mcp23s17.c \
#    ../wiringPi/wiringPi/mcp3002.c \
#    ../wiringPi/wiringPi/mcp3004.c \
#    ../wiringPi/wiringPi/mcp3422.c \
#    ../wiringPi/wiringPi/mcp4802.c \
#    ../wiringPi/wiringPi/mcp23008.c \
#    ../wiringPi/wiringPi/mcp23016.c \
#    ../wiringPi/wiringPi/mcp23017.c \
#    ../wiringPi/wiringPi/pcf8574.c \
#    ../wiringPi/wiringPi/pcf8591.c \
#    ../wiringPi/wiringPi/piHiPri.c \
#    ../wiringPi/wiringPi/piThread.c \
#    ../wiringPi/wiringPi/rht03.c \
#    ../wiringPi/wiringPi/sn3218.c \
#    ../wiringPi/wiringPi/softPwm.c \
#    ../wiringPi/wiringPi/softServo.c \
#    ../wiringPi/wiringPi/softTone.c \
#    ../wiringPi/wiringPi/sr595.c \
#    ../wiringPi/wiringPi/wiringPiI2C.c \
#    ../wiringPi/wiringPi/wiringPiSPI.c \
#    ../wiringPi/wiringPi/wiringShift.c

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
                   $$PWD/lib/Startplugins/imports/Startplugins \
                   #$$PWD/../../DrawdesignsPage/export/Drawdesignspages\
                   $$PWD/lib/keyboard/imports/Keyboardplugins \
                   #/lib/qmllib/TimeExample

#LIBS += -L QML_IMPORT_PATH

target.path += $$PWD/
#target.path += /mnt/hgfs/BendingMachine/
INSTALLS += target
