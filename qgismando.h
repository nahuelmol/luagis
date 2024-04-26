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

static const QString s_name = QStringLiteral("mando plugin");
static const QString s_description = QStringLiteral("just a description");
static const QString s_category = QStringLiteral("Plugins");
static const QString s_version = QStringLiteral("Version 1.2.3");
static const QgisPlugin::PluginType s_type = QgisPlugin::UI;

class QgsMando:public QObject, public QgisPlugin {

    //Q_OBJECT
    public: 
        explicit QgsMando(QgisInterface* iface): mIface(iface), qaction(0) {}
        //~QgsMando();
        virtual void initGui()  override;
        virtual void unload()   override;

    //private slots:
    //void button_action();

    private:
        QgisInterface* mIface;
        QAction* qaction;
};
#endif
