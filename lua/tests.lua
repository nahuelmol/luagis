local stack = require("stack").Stack()
local point1 = {}
local point2 = {}
local point3 = {}
point1["x"] = 33
point1["y"] = 44
stack.push(point1)

point2["x"] = 55
point2["y"] = 66
stack.push(point2)

point3["x"] = 77
point3["y"] = 88
stack.push(point3)

print(stack.top().x)
print(stack.top().y)
