TEMPLATE = lib
CONFIG += plugin debug
QT += core gui widgets xml
TARGET = Mando
SOURCES += qgsmando.cpp
HEADERS += qgismando.h dialog.h


INCLUDEPATH += /usr/include/qgis
INCLUDEPATH += /usr/include/lua5.3
LIBS += -L/usr/lib -lqgis_core -lqgis_gui
LIBS += -llua5.3
