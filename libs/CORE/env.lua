---@diagnostic disable: deprecated
local metas = require("CORE/metatables")

local exports = {}

exports.ecs = function() 
    local t = {_SYSTEM_POOL = {}, _COMPONENT_POOL = {}}
    setmetatable(t, metas.ENVMETA) 
    setfenv(2,t)
    return t
end

return exports
