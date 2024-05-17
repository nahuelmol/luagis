#include <sqlite3.h>

struct QueryResult {
    std::vector<std::vector<std::string>> rows;
};

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
    QueryResult* result = static_cast<QueryResult*>(data);
    std::vector<std::string> row;
    for(int i = 0; i < argc; i++) {
        row.push_back(argv[i] ? argv[i] : "NULL");
    }
    result->rows.push_back(row);
    return 0;
}
std::string extractLastWord(const std::string& str) {
    std::size_t lastSpace = str.find_last_of(" ");
    if (lastSpace == std::string::npos) {
        return str;
    }
    return str.substr(lastSpace + 1);
}
std::vector<std::string> query(const char* myquery){
    sqlite3* db;
    QueryResult result;

    std::vector<std::string> data_returned;
    int column = 1;

    char* errMsg = 0;
    int rc;
    rc = openfile(&db);
    rc = sqlite3_exec(db, myquery, callback, &result, &errMsg);
    if(rc != SQLITE_OK){
        fprintf(stderr, "SQL error %s\n", errMsg);
        sqlite3_free(errMsg);
    } else {
        fprintf(stdout, "command executed successfully\n");
        std::string last = extractLastWord(myquery);
        std::string cmd(myquery);
        std::string firstcmd = cmd.substr(0,6);
        if(firstcmd == "SELECT"){
            std::string aux;
            for(const auto& row : result.rows) {
                for(const auto& value : row) {
                    std::string condition = "ALLSEVS";
                    if (last == condition) {
                        if (column == 2){
                            std::cout << "value:" << value << std::endl;
                            data_returned.push_back(value);
                        }
                    } else {
                        if(column == 1){
                            aux = value;
                        }
                        else if (column == 2){
                            aux.append(";");
                            aux.append(value);
                        } 
                        else if (column == 3) {
                            aux.append(";");
                            aux.append(value);
                            data_returned.push_back(aux);
                        }
                    }
                     
                    column = column + 1;
                }
                column = 1;
            }
        }
    }
    sqlite3_close(db);
    return data_returned;
}
int query_addapted(lua_State* L){
    const char* querystr = lua_tostring(L, 1);
    std::vector<std::string> result = query(querystr);
    int i = 1;
    for(const auto& each: result){
        std::string sev_id = "SEV";
        sev_id.append(std::to_string(i));
        lua_pushstring(L,  each.c_str());
        lua_setglobal(L, sev_id.c_str());
        i = i + 1;
    }
    lua_pushinteger(L, i-1);
    lua_setglobal(L, "DATASET_LEN");
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
