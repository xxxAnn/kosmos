-- Copyright (C) 2023 Ann Mauduy-Decius

local components = require("src/components")
local utils = require("src/utils")
local entities = utils.pretty_print_table() 
-- p should be a list of components
-- TODO: prevent p from having duplicate components
function entities:spawn(p)
    local c = utils.pretty_print_table() 
    for _, comp in ipairs(p) do
        if comp.__is_component ~= true then 
            error("Non-component in entity.")
        end
        if c[components.getId(comp)] == nil then
            c[components.getId(comp)] = true
        else 
            error("Duplicate component in entity.")
        end
    end
    local p_mt = {}
    p_mt.__index = p_mt
    p_mt.__is_entity = true

    setmetatable(p, p_mt)
    table.insert(self, p)
end

return entities