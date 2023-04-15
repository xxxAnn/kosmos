-- Copyright (C) 2023 Ann Mauduy-Decius

local errors = require("src/errors")

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

function comps_mt:__call(id, t)
    local comp_mt = {}
    local comp = t or {}

    if comps[id] ~= nil then 
        return comps[id] 
    else 
        comps[id] = comp
    end

    function comp_mt:__call(arg)
        local o = {}

        o.__id = id -- Special marker
        for k, v in pairs(comp) do
            if comps.getId(arg[k]) == v and k ~= "__id" then
                o[k] = arg[k]
            else
                local err = errors.wrong_argument_type{expected = v, got = comps.getId(arg[k]), key = k, fname = string.format("%s constructor", id)}
                err:err()
            end
        end

        return o
    end

    setmetatable(comp, comp_mt)
    return comp
end

setmetatable(comps, comps_mt)
return comps
