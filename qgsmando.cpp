#include<iostream>
#include<lua.hpp>
#include<cmath>
//#include<qgisplugin.h>

#include <QtWidgets>
#include "qgismando.h"
#include "qgisinterface.h"
#include <QAction>

#include "ui_interface.h"

//QgsMando::QgsMando(QgisInterface* iface): mIface(iface) {}
//QgsMando::~QgsMando(){}

double add(float a, float b){
    return a + b;
}

int addadapted(lua_State* L){
    //int nargs = lua_gettop(L);
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
}

void QgsMando::initGui(){
    std::cout << "::initGui" << std::endl;
    /*qaction = new QAction(QIcon(""), QString("hello"), this);
    connect(qaction, SIGNAL(triggered()), this, SLOT(button_action()));
    mIface->addPluginToMenu(QString("&Hello"), qaction);*/
    lua_connection();
}

void QgsMando::unload(){
    std::cout << "::unload" << std::endl;
}

QGISEXTERN QgisPlugin* classFactory(){
    return new QgsMando();
}

QGISEXTERN QString name(){
    return "Mandalorian";
}
QGISEXTERN QString description(){
    return "what can I describe";
}
QGISEXTERN QString version(){
    return "1.0";
}

QGISEXTERN int type(){
    return QgisPlugin::UI;
}

QGISEXTERN void unload(QgisPlugin* plugin){
    delete plugin;
}

/*double rest(float a, float b){
    return a - b;
}

int restadapted(lua_State* L){
    //int nargs = lua_gettop(L);

    double a = lua_tonumber(L,1);
    double b = lua_tonumber(L,2);

    double result = rest(a,b);
    lua_pushnumber(L, result);

    return 1;
}


int main(int argc, char *argv[]){
    lua_State* L = luaL_newstate();
    luaL_openlibs(L);
    luaL_Reg myMath[] = {
        {"add",     addadapted},
        {"rest",    restadapted},
        {NULL, NULL}
    };

    lua_newtable(L);
    luaL_setfuncs(L, myMath, 0);
    lua_setglobal(L, "myMath");
    if (luaL_loadfile(L, "lua/init.lua") || lua_pcall(L,0,0,0)){
        std::cerr << "Error" << lua_tostring(L, -1) << endl;
        lua_close(L);
        return 1;
    }

    lua_close(L);
    return 1;
}*/
