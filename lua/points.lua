function convert2geo(target)
    --Idk how exactly convert to geographic coordinates
    return target
end


function add_new_point(x,y)
    local xconverted = convert2geo(x)
    local yconverted = convert2geo(y)

    local latitud = xconverted
    local longitud= yconverted
end
