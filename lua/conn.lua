local prev_path = package.path
package.path = "lua/?.lua;../lua/?.lua;" ..package.path
local queries = require('queries')
package.path = prev_path

-- In the original program, I must push the OPC value from cpp code 
-- Here I'm testing the possible switch
-- just one SEV must be worked during the program, avoiding identation between SEVs
-- then referencing it by "current SEVs" is redundant

local SEVNAME  = sevname
local COMMAND  = command

function SWITCHER(OPC)
    if(OPC == "ADDP") then
        local qr = queries.addPOINT(SEVNAME,x,y)
        db.query(qr)
    elseif(OPC == "DELP") then
        local qr = queries.delPOINT(SEVNAME)
        db.query(qr)
    elseif(OPC == "ADDSEV") then
        local qr = queries.addSEV(SEVNAME)
        db.query(qr)
    elseif(OPC == "DELSEV") then
        local qr = queries.delSEV(SEVNAME)
        db.query(qr)
    elseif(OPC == "CLEANSEV") then
        local qr = queries.cleanSEV(SEVNAME)
        db.query(qr)
    else
        print("nothing useful to do here")
    end
end
SWITCHER(COMMAND)

