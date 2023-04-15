-- Copyright (C) 2023 Ann Mauduy-Decius

local components = require("src/components")

local defaults = {}

defaults.string_wrapper = components.new("str", {c = "string"})

function defaults.string_wrapper.__init(o, o_mt) 
    function o_mt.__tostring()
        return "Comp (str) " .. '"' .. o.c .. '"'
    end
    o.__special_print = true
end

return defaults