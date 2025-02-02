unix {
    MY_OS += "unix"
    exists(/usr/include/qt4/Qt) {
      INCLUDEPATH += /usr/include/qt4/Qt
    }
    exists(/usr/include/ta-lib) {
      INCLUDEPATH += /usr/include/ta-lib
    }
    exists(/usr/local/include/ta-lib) {
      INCLUDEPATH += /usr/local/include/ta-lib
    }
    exists(/usr/local/lib) {
      LIBS += -L/usr/local/lib
    }
}

freebsd-g++ {
    MY_OS += "freebsd"
    INCLUDEPATH += /usr/X11R6/include
}

linux-g++ {
    MY_OS += "linux"
}

macx {
    MY_OS += "macx"
    exists(/opt/local/include/ta-lib) {
      INCLUDEPATH += /opt/local/include/ta-lib
    }
    exists(/opt/local/lib) {
      LIBS += -L/opt/local/lib
    }
    exists(/sw/include/ta-lib) {
      INCLUDEPATH += /sw/include/ta-lib
    }
    exists(/sw/lib) {
      LIBS += -L/sw/lib
    }
}

!exists(qtstalker.config) {
    error("Missing configuration file qtstalker.config")
} else {
    message("Including qtstalker.config")
    include(qtstalker.config)
}

TA_LIB_VERSION = $$system(ta-lib-config --version)
contains(TA_LIB_VERSION, 0.3.0) {
    LIBS += -lta_abstract
    LIBS += -lta_common
    LIBS += -lta_func
} else {
    LIBS += -lta_lib
}


INCLUDEPATH = $$unique(INCLUDEPATH)
LIBS        = $$unique(LIBS)

message("Writing .qmake.cache")
system(echo "INCLUDEPATH=$$INCLUDEPATH" > .qmake.cache)
system(echo "LIBS=$$LIBS" >> .qmake.cache)
system(echo "MY_OS=$$MY_OS" >> .qmake.cache)

message("Using INCLUDEPATH=$$INCLUDEPATH")
message("Using LIBS=$$LIBS")
message("Operating system: $$MY_OS")
!isEmpty(QMAKESPEC) {
  message("QMAKESPEC: $$QMAKESPEC")
}

QMAKE_DISTCLEAN += .qmake.cache

TEMPLATE = subdirs

# compile app
SUBDIRS += src

# compile plugins
SUBDIRS += plugins/Accumulate
SUBDIRS += plugins/AD
SUBDIRS += plugins/ADX
SUBDIRS += plugins/ADXR
SUBDIRS += plugins/Arithmetic
SUBDIRS += plugins/AROON
SUBDIRS += plugins/ATR
SUBDIRS += plugins/BBANDS
SUBDIRS += plugins/BOP
SUBDIRS += plugins/BarLengthButton
SUBDIRS += plugins/ColorButton
SUBDIRS += plugins/CompareValues
SUBDIRS += plugins/CCI
SUBDIRS += plugins/CDL
SUBDIRS += plugins/CMO
SUBDIRS += plugins/CSV
SUBDIRS += plugins/CurveBar
SUBDIRS += plugins/CurveCandle
SUBDIRS += plugins/CurveCloud
SUBDIRS += plugins/CurveColor
SUBDIRS += plugins/CurveHistogram
SUBDIRS += plugins/CurveLine
SUBDIRS += plugins/CurveOHLC
SUBDIRS += plugins/DataBase
SUBDIRS += plugins/DateRangeButton
SUBDIRS += plugins/FI
SUBDIRS += plugins/FileButton
SUBDIRS += plugins/FontButton
SUBDIRS += plugins/Group
SUBDIRS += plugins/HT
SUBDIRS += plugins/Indicator
SUBDIRS += plugins/IndicatorInput
SUBDIRS += plugins/IndicatorPlot
SUBDIRS += plugins/LINEARREG
#SUBDIRS += plugins/MA
#SUBDIRS += plugins/MACD
#SUBDIRS += plugins/MAMA
#SUBDIRS += plugins/MarkerBuy
#SUBDIRS += plugins/MarkerHLine
#SUBDIRS += plugins/MarkerRetracement
#SUBDIRS += plugins/MarkerSell
#SUBDIRS += plugins/MarkerText
#SUBDIRS += plugins/MarkerTLine
#SUBDIRS += plugins/MarkerVLine
#SUBDIRS += plugins/MDI
#SUBDIRS += plugins/MFI
#SUBDIRS += plugins/MOM
#SUBDIRS += plugins/PDI
#SUBDIRS += plugins/PHASOR
#SUBDIRS += plugins/Plot
#SUBDIRS += plugins/ROC
#SUBDIRS += plugins/RSI
SUBDIRS += plugins/SAR
SUBDIRS += plugins/Scanner
SUBDIRS += plugins/SINE
SUBDIRS += plugins/STDDEV
SUBDIRS += plugins/STOCHF
SUBDIRS += plugins/STOCHRSI
SUBDIRS += plugins/STOCHS
SUBDIRS += plugins/SZ
SUBDIRS += plugins/Symbol
SUBDIRS += plugins/SymbolButton
SUBDIRS += plugins/SymbolSelect
SUBDIRS += plugins/T3
SUBDIRS += plugins/TRIX
SUBDIRS += plugins/ULTOSC
SUBDIRS += plugins/VAR
SUBDIRS += plugins/WILLR
SUBDIRS += plugins/YahooHistory

##SUBDIRS += plugins/Script
##SUBDIRS += plugins/ValuesDialog

# install docs and i18n
SUBDIRS += docs

