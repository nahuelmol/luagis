
local messgs = require('lua/messages')
local points = require('lua/points') 
--it must be from the root where qgis is executed
--how to execute functions from other files

local sum = myMath.add(12,10)
local res = myMath.res(12,2)

a = {}

a["first"] = sum
a["second"]= res

print(a["first"])
print(a["second"])

messgs.welcome()
