#include <iostream>


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

lua_State* lua_connection(){
    lua_State* L = luaL_newstate();
    luaL_openlibs(L);
    lua_newtable(L);
    return L;
}

int lua_load(std::string& filename, lua_State* L){
    std::string path = "lua/" + filename + ".lua";
    const char* filepath = path.c_str();
    if (luaL_loadfile(L, filepath) || lua_pcall(L,0,0,0)){
        std::cerr << "Error" << lua_tostring(L, -1) << std::endl;
        lua_close(L);
        return 1;
    }
    lua_close(L);
    return 0;
}

void addPoint(float x, float y, QgsVectorLayer* vectorlayer){
    //vectorlayer->startEditing();
    if (!vectorlayer->isEditable()) {
        if(!vectorlayer->startEditing()){
            qDebug() << "problem starting editing session";
            vectorlayer->rollBack();
            return;
        }
    }
    if(vectorlayer->isEditable()){
        qDebug() << "editable";
    }
    qDebug() << "starting editing session";
    //QgsFeature feature;
    //QgsMultiPointXY multipoint;
    //QgsPointXY fpoint(x,y);
    //multipoint.addGeometry(QgsGeometry::fromPointXY(point));
    //QgsGeometry geopoint = QgsGeometry::fromPointXY(fpoint);
    //const QgsAbstractGeometry *cabsgeopoint = geopoint.constGet();
    //QgsAbstractGeometry* absgeopoint = const_cast<QgsAbstractGeometry*>(cabsgeopoint);
    //multipoint.addGeometry(absgeopoint);
    //multipoint.append(fpoint);
    //QgsGeometry neoGEO = QgsGeometry::fromMultiPointXY(multipoint);
    //feature.setGeometry(neoGEO);
    /*if (!vectorlayer->addFeature(feature)) {
        // Handle error adding feature
        vectorlayer->rollBack();
        qDebug() << "error adding feature";
        QgsError error = vectorlayer->dataProvider()->error();
        qDebug() << "Data Provider Error:" << error.type();
        return;
    }*/
    //if(feature.hasGeometry()){
    //    qDebug() << "has geometry";
    //}
    //vectorlayer->addFeature(feature);
    if(!vectorlayer->commitChanges()){
        qDebug() << "Error commiting changes";
    };
}
