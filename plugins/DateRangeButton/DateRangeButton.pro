TEMPLATE = lib
CONFIG += plugin
MOC_DIR += build
OBJECTS_DIR += build
INCLUDEPATH += ../../src


HEADERS += DateRangeButton.h
SOURCES += DateRangeButton.cpp
HEADERS += DateRangeButtonObject.h
SOURCES += DateRangeButtonObject.cpp
HEADERS += DateRangeButtonWidget.h
SOURCES += DateRangeButtonWidget.cpp
HEADERS += PopupWidget.h
SOURCES += PopupWidget.cpp
HEADERS += ../../src/Object.h
HEADERS += ../../src/Util.h
HEADERS += ../../src/Plugin.h
HEADERS += ../../src/PluginCommand.h
HEADERS += ../../src/ObjectCommand.h
HEADERS += ../../src/Bars.h


OBJECTS += ../../src/build/Object.o
OBJECTS += ../../src/build/ObjectCommand.o
OBJECTS += ../../src/build/Util.o
OBJECTS += ../../src/build/Bars.o


HOME=$$system(echo $HOME) 
target.path =  $${HOME}/OTA/lib
INSTALLS += target

QT += core
QT += gui
QT += widgets
