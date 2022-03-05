-- IMPORTS
local here = ...
here = here:gsub("ecsenv", "")
------
local MOD_ecsmeta = require(here .. "ecsmeta")

-- <MOD>
local MOD_ecsenv = {}

--[[
    Creates a *special* table to set as _ENV for magic ECS!
    The table has a metatable that modifies __index and __newindex
    so that created functions are automatically.
]]--
MOD_ecsenv.ecs = function() 
    local t = {}
    setmetatable(t, MOD_ecsmeta.ENVMETA) -- The *magic* happens here
    return t
end

return MOD_ecsenv
-- </MOD>