local metas = require("CORE/metatables")
local lib = require("lib")

local exports = {}

exports.ecs = function() 
    local t = {_SYSTEM_POOL = lib.types.list(), _COMPONENT_POOL = lib.types.dict(), _COMPS = lib.types.list()}
    setmetatable(t, metas.ENVMETA) 
    setfenv(2, t)
    return t
end

return exports
