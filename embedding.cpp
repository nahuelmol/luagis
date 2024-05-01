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
    luaL_Reg myMath[] = {
        {"add",     addadapted},
        {"res",     restadapted},
        {NULL, NULL}
    };
    lua_newtable(L);
    luaL_setfuncs(L, myMath, 0);
    lua_setglobal(L, "myMath");
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
