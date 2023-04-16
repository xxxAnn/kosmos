-- Copyright (C) 2023 Ann Mauduy-Decius

local components = require("src/components")
local consts = require("src/consts")

local defaults = {}

defaults.string_wrapper = components.new("str", {c = consts.str})

function defaults.string_wrapper.__init(o, o_mt) 
    function o_mt.__tostring()
        return "Comp<str> " .. '"' .. o.c .. '"'
    end
    o.__special_print = true
end

function defaults.string_wrapper.__build(...)
    return {c = table.pack(...)[1]}
end

defaults.number_wrapper = components.new("num", {c = consts.num})

function defaults.number_wrapper.__init(o, o_mt) 
    function o_mt.__tostring()
        return "Comp<num> " .. o.c 
    end
    o.__special_print = true
end

function defaults.number_wrapper.__build(...)
    return {c = table.pack(...)[1]}
end

defaults.position = components.new("position2D", {x = consts.num, y = consts.num})

function defaults.position.__init(o, o_mt) 
    function o_mt.__tostring()
        return "Comp<position2D> " .. string.format("(%s, %s)", o.x, o.y)
    end
    o.__special_print = true
end

function defaults.position.__build(...)
    local tab = table.pack(...)
    return {x = tab[1], y = tab[2]}
end

function defaults.wrap(t) 
    if type(t) == "string" then
        return defaults.string_wrapper(t)
    elseif type(t) == "number" then
        return defaults.number_wrapper(t)
    end
    return nil
end

return defaults