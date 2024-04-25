#ifndef QGSMANDO_H
#define QGSMANDO_H

#include "qgisplugin.h"
#include "qgsmapcanvas.h"
#include "qgisinterface.h"
#include "qgsvectorlayer.h"
#include "qgsmessagelog.h"
#include <QObject>
#include <iostream>
#include <QAction>
#include <QApplication>

static const QString s_name = QStringLiteral("Hellooo");
static const QString s_description = QStringLiteral("Sample Plugin");
static const QString s_category = QStringLiteral("Plugins");
static const QString s_version = QStringLiteral("Version 1.2.3");
static const QgisPlugin::PluginType s_type = QgisPlugin::UI;

//class QAction;
class QgsMando: public QgisPlugin {

    public: 
     //QgsMando(QgisInterface* iface);
    //~QgsMando();
    QgsMando(){}
    void initGui();
    void unload();

    //private slots:
        //void button_action();

    //private:
    //QgisInterface* mIface;
    //QAction* qaction;
};

#endif
