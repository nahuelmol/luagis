
local prev_path = package.path
package.path = "lua/?.lua;../lua/?.lua;" ..package.path
local files = require("files")
package.path = prev_path

