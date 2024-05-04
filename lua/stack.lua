M = {}
function M.Stack ()
    local out = {}
    out.length = 0
    out.push = function(point)
        out[#out + 1] = point
        out.length = out.length + 1
    end

    out.top = function()
        local len = out.length
        return out[out.length]
    end
    return out
end


return M
