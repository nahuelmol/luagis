local prev_path = package.path
package.path = "lua/?.lua;../lua/?.lua;" ..package.path
local queries = require('queries')
package.path = prev_path

-- In the original program, I must push the OPC value from cpp code 
-- Here I'm testing the possible switch
-- just one SEV must be worked during the program, avoiding identation between SEVs
-- then referencing it by "current SEVs" is redundant

function getlen(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

local SEVNAME  = sevname
local COMMAND  = command

function SWITCHER(OPC)

    if (OPC == "CHECKSEVS")then
        local qr = queries.checkSEVS()
        local returned = db.query(qr)

        DATASET["SEV1"] = SEV1
        DATASET["SEV2"] = SEV2

        print("length: "..DATASET_LEN)
    elseif(OPC == "INIT") then
        local qr = queries.initALLSEVS()
        db.query(qr)
        local qr = queries.checkSEVS()
        db.query(qr)
    elseif(OPC == "ADDP") then
        local qr = queries.addPOINT(SEVNAME,x,y)
        db.query(qr)
    elseif(OPC == "DELP") then
        local qr = queries.delPOINT(SEVNAME)
        db.query(qr)
    elseif(OPC == "ADDSEV") then
        local qr = queries.addSEV(SEVNAME)
        db.query(qr)
        qr = queries.recordSEV(SEVNAME)
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

