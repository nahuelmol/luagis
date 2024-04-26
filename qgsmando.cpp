#include<iostream>
#include<lua.hpp>
#include<cmath>
#include<qgisplugin.h>
//#include "ui_interface.h"

#include <QtWidgets>
#include "qgismando.h"
#include "qgisinterface.h"
#include <QAction>

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

//QgsMando::QgsMando(QgisInterface* iface): mIface(iface), qaction(0){}
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

void QgsMando::initGui(){
    std::cout << "::initGui" << std::endl;
    //qaction = new QAction(tr("&Hello"), this);
    //connect(qaction, SIGNAL(triggered()), this, SLOT(button_action()));
    //mIface->addToolBarIcon(qaction);
    //mIface->addPluginToMenu(tr("&Hello"), qaction);
    lua_connection();
}

void QgsMando::unload(){
    //mIface->removeToolBarIcon(qaction);
    //mIface->removePluginMenu(tr("&Hello"), qaction);
    std::cout << "::unload" << std::endl;
}

//void QgsMando::button_action(){
//    std::cout << "button action" << std::endl;
//}

//Q_EXPORT_PLUGIN2();
