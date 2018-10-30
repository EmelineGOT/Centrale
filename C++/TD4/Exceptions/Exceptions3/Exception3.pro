TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += main.cpp \
    vectt.cpp \
    badrange.cpp

include(deployment.pri)
qtcAddDeployment()

HEADERS += \
    vectt.h \
    badrange.h

