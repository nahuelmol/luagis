local prev_path = package.path
package.path = "../lua/?.lua;" .. package.path
local queries = require('queries')
package.path = prev_path

-- db.connect()
-- db.query("CREATE TABLE IF NOT EXISTS MyTable (ID INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, Age INTEGER)");
-- db.query("SELECT * FROM MyTable;")

-- In the original program, I must push the OPC value from cpp code 
-- Here I'm testing the possible switch

-- just one SEV must be worked during the program, avoiding identation between SEVs
-- then referencing it by "current SEVs" is redundant

function SWITCHER(OPC)
    if(OPC == "ADDP") then
        local qr = queries.addPOINT("2024_5_11", 11,22)
        db.query(qr)
    elseif(OPC == "DELP") then
        local qr = queries.delPOINT("2024_5_11")
        db.query(qr)
    elseif(OPC == "ADDSEV") then
        local qr = queries.addSEV("2024_5_11")
        db.query(qr)
    elseif(OPC == "DELSEV") then
        local qr = queries.delSEV("2024_5_10")
        db.query(qr)
    elseif(OPC == "CLEANSEV") then
        local qr = queries.cleanSEV("2024_5_10")
        db.query(qr)
    else
        print("nothing useful to do here")
    end
end
SWITCHER("ADDSEV")
SWITCHER("ADDP")
