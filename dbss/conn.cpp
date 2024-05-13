#include <sqlite3.h>

int openfile(sqlite3** db){
    int rc;
    rc = sqlite3_open("example.db", db);
    if(rc){
        fprintf(stderr, "cannot open the file", sqlite3_errmsg(*db));
        return 0;
    } else {
        std::cout << "dbase opened" << std::endl;
    }
    return rc;
}

sqlite3* conn(){
    sqlite3* db;
    return db;
}

int callback(void *data, int argc, char **argv, char **azColName){
    int i;
    for(i=0; i<argc; i++){
        printf("%s = %s\n", azColName[i], argv[i] ? argv[i] : "NULL");
    }
    printf("\n");
    return 0;
}

void query(const char* myquery){
    sqlite3* db;
    char* errMsg = 0;
    int rc;
    rc = openfile(&db);
    rc = sqlite3_exec(db, myquery, callback, 0, &errMsg);
    if(rc != SQLITE_OK){
        fprintf(stderr, "SQL error %s\n", errMsg);
        sqlite3_free(errMsg);
    } else {
        fprintf(stdout, "command executed successfully\n");
    }
    sqlite3_close(db);
}
int query_addapted(lua_State* L){
    const char* querystr = lua_tostring(L, 1);
    query(querystr);
    return 1;
}

void connect(){
    sqlite3* db;

    int rc;
    rc = openfile(&db);
    sqlite3_close(db);
}

int conn_addapted(lua_State* L){
    connect();
    return 1;
}
