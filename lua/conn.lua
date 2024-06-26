local prev_path = package.path
package.path = "lua/?.lua;../lua/?.lua;" ..package.path
local queries = require('queries')
package.path = prev_path

-- In the original program, I must push the OPC value from cpp code 
-- Here I'm testing the possible switch
-- just one SEV must be worked during the program, avoiding identation between SEVs
-- then referencing it by "current SEVs" is redundant

local function split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

function getlen(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

local SEVNAME  = sevname
local COMMAND  = command
local ID = id

function SWITCHER(OPC)
    if (OPC == "CHECKSEVS")then
        local qr = queries.checkSEVS()
        local returned = db.query(qr)

        for i=1, DATASET_LEN do
            local key = "SEV"..i
            DATASET[key] = _G[key]
        end
    elseif(OPC == "EDITP") then
        local NEWVALUE = newvalue
        local COLUMN = column
        local qr = queries.editPOINT(SEVNAME, ID, COLUMN, NEWVALUE)
        local returned = db.query(qr)

    elseif(OPC == "RETRIEVESEV") then
        local qr = queries.retrieveSEV(SEVNAME)
        local returned = db.query(qr)
        if DATASET ~= nil then
            for i=1, DATASET_LEN do
                local key = "SEV"..i -- it is a record, not a SEV
                DATASET[key] = _G[key] 
                if DATASET[key] == nil then
                    print("is nil"..key)
                else
                    print(key.."->"..DATASET[key])
                end
            end
        else
            print("DATASET is nil")
        end
    elseif(OPC == "INIT") then
        local qr = queries.initALLSEVS()
        db.query(qr)
        local qr = queries.checkSEVS()
        db.query(qr)
    elseif(OPC == "ADDP") then
        local qr = queries.addPOINT(SEVNAME,x,y)
        db.query(qr)
    elseif(OPC == "DELP") then
        if ID ~= nil then
            print("ID"..ID)
            local qr = queries.delPOINT(SEVNAME, ID)
            db.query(qr)
        else
            print("ID is nil")
        end
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

