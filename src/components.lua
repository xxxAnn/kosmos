-- Copyright (C) 2023 Ann Mauduy-Decius

local utils = require("src/utils")

local comps_mt = {}
local comps = {}

function comps.getId(t)
    if type(t) == "table" then
        if t["__id"] ~= nil then
            return t.__id
        end
    end
    return type(t)
end

function comps.new(id, t)
    local comp_mt = {}
    local comp = t or {}
    -- The default constructor
    function comp.__new(...) 
        return table.pack(...)[1]
    end

    if comps[id] ~= nil then 
        return comps[id] 
    else 
        comps[id] = comp
    end

    function comp_mt:__call(...)
        local o = utils.pretty_print_table()

        o.__id = id -- Special marker
        o.__is_component = true
        o.__special_print = false

        local arg = comp.__new(...)

        for k, v in pairs(comp) do
            if string.sub(k, 1, 1) ~= "_" then
                if comps.getId(arg[k]) == v then
                        o[k] = arg[k]
                else
                    error(
                        string.format("Expected key '%s' to be of type %s in call to '%s'. Got object of type %s.", 
                        k, 
                        v, 
                        string.format("%s constructor", id), 
                        comps.getId(arg[k]))
                    )
                end
            end
        end

        if type(comp.__init) == "function" then comp.__init(o, getmetatable(o)) end

        return o
    end



    setmetatable(comp, comp_mt)
    return comp
end

comps.get = comps.new

setmetatable(comps, comps_mt)
return comps
