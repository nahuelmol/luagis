M = {}

function M.addSEV(date)
    --current_date -> Idk where to take the date, from here or from cpp
    name = " SEV"..date
    head = "CREATE TABLE IF NOT EXISTS"
    id   = "ID INTEGER PRIMARY KEY AUTOINCREMENT"

    complete_qry = head..name.." ("..id..", ABm REAL, Pa REAL)"
    return complete_qry
end

function M.delSEV(date)
    name = " SEV"..date
    head = "CREATE TABLE IF NOT EXISTS"
    ab = "ABm FLOAT"
    pa = "Pa FLOAT"

    complete_query = head..name.." ("..ab..","..pa..")"
    return complete_qry
end

function M.addPOINT(tabledate, abm, pa)
    head = "INSERT INTO SEV"..tabledate

    complete_qry = head.."(ABm, Pa) VALUES ("..abm..","..pa..")"
    return complete_qry
end

function M.delPOINT(tablename, recordid)
    head  = "DELETE FROM "..tablename.."WHERE "
    condition = "id = "..recordid

    complete_qry = head..condition
    return complete_qry
end

function M.cleanSEV(tablename)
    head = "DELETE FROM "..tablename
    return head
end

return M
