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


void Dialog::example(){
    std::cout << "from example" << std::endl;
}

void Dialog::submit_content(){
    QString text = edit->text();
    std::string texto = text.toStdString();
    //qDebug() << "Submitted text:" << text;
    std::cout << "content:" << texto << std::endl;
}

Dialog::Dialog(QWidget *parent): QDialog(parent){
    setFixedSize(400,300);

    layout  = new QVBoxLayout(this);
    label   = new QLabel("hello", this);
    button  = new QPushButton("example", this);
    submit  = new QPushButton("submit", this);
    edit    = new QLineEdit(this);

    connect(button, &QPushButton::clicked, this, &Dialog::example);
    connect(submit, &QPushButton::clicked, this, &Dialog::submit_content);

    edit->setPlaceholderText("Enter text here");
    layout->setContentsMargins(20, 20, 20, 20);
    layout->addWidget(button);
    layout->addWidget(submit);
    layout->addWidget(edit);
    layout->addWidget(label);
    setLayout(layout);
}


double rest(float a, float b){
    return a - b;
}

double add(float a, float b){
    return a + b;
}

int restadapted(lua_State* L){
    double a = lua_tonumber(L,1);
    double b = lua_tonumber(L,2);
    double result = rest(a,b);
    lua_pushnumber(L, result);
    return 1;
}

int addadapted(lua_State* L){
    double a = lua_tonumber(L,1);
    double b = lua_tonumber(L,2);
    double result = add(a,b);
    lua_pushnumber(L, result);
    return 1;
}

int lua_connection(){
    lua_State* L = luaL_newstate();
    luaL_openlibs(L);
    luaL_Reg myMath[] = {
        {"add",     addadapted},
        {"res",     restadapted},
        {NULL, NULL}
    };
    lua_newtable(L);
    luaL_setfuncs(L, myMath, 0);
    lua_setglobal(L, "myMath");

    if (luaL_loadfile(L, "lua/init.lua") || lua_pcall(L,0,0,0)){
        std::cerr << "Error" << lua_tostring(L, -1) << std::endl;
        lua_close(L);
        return 1;
    }
    lua_close(L);

    return 0;
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
    lua_connection();
}

void QgsMando::unload(){
    mIface->removePluginMenu(tr("&Mando"), qaction);
    mIface->removePluginMenu(tr("&Dialog"), dialogAction);
    std::cout << "::unload" << std::endl;
}

