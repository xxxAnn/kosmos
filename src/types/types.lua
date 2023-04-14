local special_types = require("src/types/special_types")

local types_mt = {}
local types = {}

function types.getType(t)
    if type(t) == "table" then
        if t["__type"] ~= nil then
            return t.__type
        end
    end
    return type(t)
end

function types_mt:__call(id, t)
    local type_mt = {}
    local ltype = t or {}

    if types[id] ~= nil then 
        return types[id] 
    else 
        types[id] = ltype
    end

    function type_mt:__call(arg)
        local o = {}

        o.__type = id -- Special marker
        for k, v in pairs(ltype) do
            if types.getType(arg[k]) == v and k ~= "__type" then
                o[k] = arg[k]
            else
                local err = special_types.errors.wrong_argument_type{expected = v, got = types.getType(arg[k]), key = k, fname = string.format("%s constructor", id)}
                err:err()
            end
        end

        return o
    end

    setmetatable(ltype, type_mt)
    return ltype
end

setmetatable(types, types_mt)
return types
