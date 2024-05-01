
M = {}

function M.FindFiles(filename)
    print("I must find files")
    -- formats .csv .dat .txt
    completeName = filename + ".csv"
    return true
end

function M.convertFileToTable()
    print("just convert them into a table")
    filename = "example"
    res = FindFile(filename)
    if(res) then
        print("the file exists")
    else
        print("the file doesn't exists")
end

return M
