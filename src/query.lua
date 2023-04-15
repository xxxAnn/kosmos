local components = require("src/components")
local entities = require("src/pool")
local utils = require("src/utils")

local query_mt = {}
local query = {}

function query.match(q, entity)
    -- all components should only be present once in each entity and query
    for _, comp_id in ipairs(q) do
        local n = false
        for _, comp in ipairs(entity) do
            if components.getId(comp) == comp_id then
                n = true
                break
            end
        end
        if n == false then return false end
    end
    return true
end

function query_mt:__call(q)
    local temp = utils.pretty_print_table() 
    for _, entity in ipairs(entities) do
        if self.match(q, entity) then 
            local temp1 = utils.pretty_print_table() 
            for _, comp in ipairs(entity) do
                temp1[components.getId(comp)] = comp
            end
            table.insert(temp, temp1)
        end
    end

    function temp:then_call(f)
        if type(f) ~= "function" then error("Expected function.") end
        for _, v in ipairs(self) do
            f(v)
        end
    end
    
    return temp
end

setmetatable(query, query_mt)
return query
