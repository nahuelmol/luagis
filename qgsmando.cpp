#include<lua.hpp>
#include<cmath>
#include<qgisplugin.h>
//#include "ui_interface.h"

//#include <QgsProject>
//#include <QgsMapLayer>
#include <QtWidgets>
#include "qgismando.h"
#include "dialog.h"
#include "qgisinterface.h"
#include <QAction>
#include <QComboBox>

#include <qgsmultipoint.h>
#include <qgsgeometry.h>
#include <qgsabstractgeometry.h>
#include <qgsfeature.h>

#include "embedding.cpp"
#include "dbss/conn.cpp"

void Dialog::add_sev(){
    QString sev = sev_edit->text();
    qDebug() << "the name is" << sev;
    sev_edit->setPlaceholderText("");

    std::string filename = "conn";
    lua_State* L = lua_connection();
    QByteArray bytesev = sev.toUtf8();
    const char* charsev = bytesev.constData();
    lua_pushstring(L, charsev);
    lua_setglobal(L, "sevname");
    lua_pushstring(L, "ADDSEV");
    lua_setglobal(L, "command");
    luaL_Reg db[] = {
        {"connect",     conn_addapted},
        {"query",       query_addapted},
        {NULL, NULL}
    };
    luaL_setfuncs(L,db, 0);
    lua_setglobal(L, "db");
    lua_load(filename, L);
    lua_close(L);
}

QgsVectorLayer* lookat(std::string target_layer){
    QgsProject *project = QgsProject::instance();
    QList<QgsMapLayer *> mapLayers = project->mapLayers().values();
    for(QgsMapLayer *layer: mapLayers){
        QString layername = layer->name();
        std::string layern= layername.toStdString();
        if(layern == target_layer){
            QgsVectorLayer* vectorLayer = qobject_cast<QgsVectorLayer*>(layer);
            return vectorLayer;
        }
    }
    return nullptr;
}

std::string justname(std::string entire){
    char delimiter = ':';
    std::string name;
    std::istringstream stream(entire);
    std::getline(stream, name, delimiter);
    return name;
}
std::string nameafter(std::string entire){
    size_t pos = entire.find(':');
    if (pos != std::string::npos && pos + 1 < entire.length()) {
        std::string secondPart = entire.substr(pos + 1);
        std::cout << "Second part: " << secondPart << std::endl;
        return secondPart;
    } else {
        std::cout << "Colon not found or no second part." << std::endl;
        return "";
    }
}

void Dialog::submit_content(){
    QString xcoor = xedit->text();
    QString ycoor = yedit->text();
    std::string xcoordinate = xcoor.toStdString();
    std::string ycoordinate = ycoor.toStdString();

    QString old_content = points_label->text();
    QString new_content = old_content + "\n" +"("+ xcoor + "," + ycoor+")"; 
    points_label->setText(new_content);

    float xnumber = std::stof(xcoordinate);
    float ynumber = std::stof(ycoordinate);

    QString selected_layer = layer_cbox->currentText();
    std::string target = selected_layer.toStdString();
    std::string targetname = justname(target);
    QString fordebug = QString::fromStdString(targetname);
    qDebug() << "selected layer: " << fordebug;

    currentVectorLayer = lookat(targetname);//with the name it returns the layer
    if(currentVectorLayer != nullptr){
        addPoint(xnumber, ynumber, currentVectorLayer);
        qDebug() << "current vector layer name:" << currentVectorLayer->name();
    } else {
        qDebug() << "current Vector layer is null";
    }

    //a point requires -> sevname, command (lua) and point(x,y) values
    QString sevinbox    = combobox->currentText();
    std::string sevall  = sevinbox.toStdString();
    std::string sev     = nameafter(sevall);
    //QString sev = sev_edit->text();
    //QByteArray bytesev = sev.toUtf8();
    //const char* charsev = bytesev.constData();

    lua_State* L = lua_connection();
    lua_pushstring(L, sev.c_str());
    lua_setglobal(L, "sevname");
    lua_pushstring(L, "ADDP");
    lua_setglobal(L, "command");

    lua_pushnumber(L, xnumber);
    lua_setglobal(L, "x");
    lua_pushnumber(L, ynumber);
    lua_setglobal(L, "y");
    luaL_Reg db[] = {
        {"connect",     conn_addapted},
        {"query",       query_addapted},
        {NULL, NULL}
    };
    luaL_setfuncs(L, db,0);
    lua_setglobal(L, "db");

    std::string conn_file = "conn";
    lua_load(conn_file, L);
    lua_close(L);
}

void Dialog::sev_checker(){
    //this will list all SEVS created
    lua_State* L = lua_connection();
    lua_pushstring(L, "CHECKSEVS");
    lua_setglobal(L, "command");

    lua_newtable(L);
    lua_setglobal(L,"DATASET");

    std::string filename = "conn";
    luaL_Reg db[] = {
        {"connect",     conn_addapted},
        {"query",       query_addapted},
        {NULL, NULL}
    };
    luaL_setfuncs(L, db,0);
    lua_setglobal(L, "db");
    lua_load(filename,L);

    int i = 1;
    lua_getglobal(L,"DATASET");
    if(lua_istable(L,-1)){
        lua_pushnil(L);
        while(lua_next(L,-2) != 0){
            std::string option = lua_tostring(L,-2);
            option.append(":");
            option.append(lua_tostring(L,-1));
            std::cout << "option:" << option << std::endl;
            combobox->addItem(option.c_str());
            lua_pop(L,1);
        }
    }
    lua_close(L);
}

void Dialog::layers_handler(){
    QgsProject *project = QgsProject::instance();
    std::vector<std::string> options;
    if(!project){
        std::cout << "theres not a project"<< std::endl;
    } else {
        QList<QgsMapLayer *> mapLayers = project->mapLayers().values();
        for (QgsMapLayer *layer: mapLayers){
            QString layerN = layer->name(); //layer name
            QString layerT = layer->dataProvider()->name(); //layer type

            std::string layer_type = layerT.toStdString();
            std::string layer_name = layerN.toStdString();
            std::string layercomplete;
            layercomplete.append(layer_name);
            layercomplete.append(":");
            layercomplete.append(layer_type);
            options.push_back(layercomplete);

            QgsVectorLayer* vectorLayer = qobject_cast<QgsVectorLayer*>(layer);
            if(vectorLayer){
                QgsWkbTypes::Type geometryType = vectorLayer->wkbType();
                switch(geometryType){
                    case QgsWkbTypes::Point:
                        qDebug() << "point vector layer:" << layerT;
                        break;
                    case QgsWkbTypes::MultiPoint:
                        qDebug() << "multipoint vector layer:" << layerT;
                        //currentVectorLayer = vectorLayer;
                        break;
                    case QgsWkbTypes::LineString:
                    case QgsWkbTypes::LineStringM:
                    case QgsWkbTypes::LineStringZ:
                    case QgsWkbTypes::LineStringZM:
                        qDebug() << "line string vector layer:" << layerT;
                        break;
                    case QgsWkbTypes::Polygon:
                    case QgsWkbTypes::PolygonM:
                    case QgsWkbTypes::PolygonZ:
                    case QgsWkbTypes::PolygonZM:
                        qDebug() << "polygon vector layer:" << layerT;
                        break;
                    default:
                        qDebug() << "vector layer unknown:"<< layerT;
                        break;
                }
            } else {
                qDebug() << "not a vector layer:" << layerT;
            }
        }
    }
    std::string filename = "layers";
    lua_State* L = lua_connection();
    lua_load(filename, L);
    lua_close(L);

    for(const auto& option: options){
        layer_cbox->addItem(option.c_str());
    }
}

void displayingComboBox(QComboBox *combobox){
    lua_State *L = lua_connection();
    std::string filename = "conn";
    
    //I am going to create ALLSEVS if it is not created
    lua_pushstring(L, "INIT");
    lua_setglobal(L, "command");
    luaL_Reg db[] = {
        {"connect",     conn_addapted},
        {"query",       query_addapted},
        {NULL, NULL}
    };
    luaL_setfuncs(L, db,0);
    lua_setglobal(L, "db");
    lua_load(filename,L);
    lua_close(L);
}

Dialog::Dialog(QWidget *parent): QDialog(parent){
    setFixedSize(800,500);

    layout      = new QVBoxLayout(this);
    submit      = new QPushButton("submit", this);
    xedit       = new QLineEdit(this);
    yedit       = new QLineEdit(this);
    points_label= new QLabel("Points:", this);
    sev_label   = new QLabel("SEV:", this); 

    combobox    = new QComboBox(this);
    layer_cbox  = new QComboBox(this);

    layers_btn = new QPushButton("layers", this);
    connect(layers_btn, &QPushButton::clicked, this, &Dialog::layers_handler);
    connect(submit, &QPushButton::clicked, this, &Dialog::submit_content);

    addsev      = new QPushButton("Add sev", this); 
    sev_edit    = new QLineEdit(this);
    connect(addsev, &QPushButton::clicked, this, &Dialog::add_sev);
    
    checksev    = new QPushButton("check available sevs");
    connect(checksev, &QPushButton::clicked, this, &Dialog::sev_checker);

    sev_edit->setPlaceholderText("sev name here");
    xedit->setPlaceholderText("enter x coor");
    yedit->setPlaceholderText("enter y coor");
    layout->setContentsMargins(20, 20, 20, 20);
    layout->addWidget(points_label);
    layout->addWidget(layer_cbox);
    layout->addWidget(submit);
    layout->addWidget(xedit);
    layout->addWidget(yedit);

    layout->addWidget(sev_label);
    layout->addWidget(addsev);
    layout->addWidget(sev_edit);
    layout->addWidget(checksev);

    displayingComboBox(combobox);
    layout->addWidget(combobox);
    setLayout(layout);
}

QgsMando::QgsMando(QgisInterface* iface): QgisPlugin(s_name, s_description, s_category, s_version, s_type), mIface(iface){}

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

//void QgsMando::button_action(){
//    std::cout << "button action" << std::endl;
//    QgsMessageLog::logMessage(QString("menu clicked"), QString("again welcome"), Qgis::MessageLevel::Info);
//}

void QgsMando::show_dialog(){
    Dialog Mydialog;
    Mydialog.exec();
}

void QgsMando::initGui(){
    std::cout << "::initGui" << std::endl;
    dialogAction = new QAction(tr("&Add SEVS"), this);
    connect(dialogAction, &QAction::triggered, this, &QgsMando::show_dialog);
    mIface->addPluginToMenu(tr("&Sev"),dialogAction);

    std::string init = "init";
    lua_State* L = lua_connection();
    lua_pushinteger(L, 42);
    lua_setglobal(L, "myvariable");
    lua_load(init, L);
    lua_close(L);
}

void QgsMando::unload(){
    //mIface->removePluginMenu(tr("&Mando"), qaction);
    mIface->removePluginMenu(tr("&Dialog"), dialogAction);
    std::cout << "::unload" << std::endl;
}

