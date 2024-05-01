#include<iostream>
#include<lua.hpp>
#include<cmath>
#include<qgisplugin.h>
//#include "ui_interface.h"

#include <QtWidgets>
#include "qgismando.h"
#include "dialog.h"
#include "qgisinterface.h"
#include <QAction>
#include "embedding.cpp"

void Dialog::submit_content(){
    QString xcoor = xedit->text();
    QString ycoor = yedit->text();
    std::string xcoordinate = xcoor.toStdString();
    std::string ycoordinate = ycoor.toStdString();

    float xnumber = std::stof(xcoordinate);
    float ynumber = std::stof(ycoordinate);

    std::string filename = "submit";
    //start L
    lua_State* L = lua_connection();

    lua_pushnumber(L, xnumber);
    lua_setglobal(L, "xnumber");
    lua_pushnumber(L, ynumber);
    lua_setglobal(L, "ynumber");

    lua_load(filename, L);
    //end L
    //qDebug() << "Submitted text:" << text;
}

void Dialog::layers_handler(){
    std::string filename = "layers";
    lua_State* L = lua_connection();
    lua_load(filename, L);
}

Dialog::Dialog(QWidget *parent): QDialog(parent){
    setFixedSize(400,300);

    layout  = new QVBoxLayout(this);
    submit  = new QPushButton("submit", this);
    xedit    = new QLineEdit(this);
    yedit    = new QLineEdit(this);

    layers_btn = new QPushButton("layers", this);
    connect(layers_btn, &QPushButton::clicked, this, &Dialog::layers_handler);
    connect(submit, &QPushButton::clicked, this, &Dialog::submit_content);

    xedit->setPlaceholderText("enter the x coor");
    yedit->setPlaceholderText("enter the y coor");
    layout->setContentsMargins(20, 20, 20, 20);
    layout->addWidget(submit);
    layout->addWidget(xedit);
    layout->addWidget(yedit);
    setLayout(layout);
}



QgsMando::QgsMando(QgisInterface* iface): QgisPlugin(s_name, s_description, s_category, s_version, s_type), mIface(iface){}
//QgsMando::~QgsMando(){}

QGISEXTERN QgisPlugin* classFactory(QgisInterface* iface){
    return new QgsMando(iface);
}

QGISEXTERN const QString* name(){
    return &s_name;
}

QGISEXTERN const QString* description(){
    return &s_description;
}

QGISEXTERN const QString* category(){
    return &s_category;
}

QGISEXTERN const QString* version(){
    return &s_version;
}

QGISEXTERN int type(){
    return s_type;
}

QGISEXTERN void unload(QgisPlugin* plugin){
    delete plugin;
}

void QgsMando::button_action(){
    std::cout << "button action" << std::endl;
    QgsMessageLog::logMessage(QString("menu clicked"), QString("again welcome"), Qgis::MessageLevel::Info);
}

void QgsMando::show_dialog(){
    Dialog Mydialog;
    Mydialog.exec();
}

void QgsMando::initGui(){
    std::cout << "::initGui" << std::endl;
    qaction = new QAction(tr("&Start"), this);
    dialogAction = new QAction(tr("&Show Dialog"), this);
    connect(qaction, &QAction::triggered, this, &QgsMando::button_action);
    connect(dialogAction, &QAction::triggered, this, &QgsMando::show_dialog);
    mIface->addPluginToMenu(tr("&Mando"), qaction);
    mIface->addPluginToMenu(tr("&Dialog"),dialogAction);

    std::string init = "init";
    lua_State* L = lua_connection();
    lua_pushinteger(L, 42);
    lua_setglobal(L, "myvariable");
    lua_load(init, L);
}

void QgsMando::unload(){
    mIface->removePluginMenu(tr("&Mando"), qaction);
    mIface->removePluginMenu(tr("&Dialog"), dialogAction);
    std::cout << "::unload" << std::endl;
}

