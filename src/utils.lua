local utils = {}

local function pretty_print_wrapper(tp, i) 
    if type(tp) ~= "table" or tp.__special_print == true then 
        local m =  tostring(tp)
        if type(tp) == "string" then return '"' .. m .. '"' else return m end
    end
    local n = ""
    if tp.__is_component == true then 
        n = "Comp (" .. tp.__id .. ") "
    else
        n = "BaseTable " 
    end
    local dit = false
    local s = n .. '{\n'
    for k,v in pairs(tp) do
        if string.sub(k, 1, 1) ~= "_" then 
            dit = true
            if type(k) ~= 'number' then k = '"'..k..'"' end

            s = s .. string.rep("   ", i or 0) .. '['..k..'] = ' .. pretty_print_wrapper(v, (i or 0)+1) .. ",\n"
        end
    end
    if #s > 2 and dit then
        s = string.sub(s, 1, #s-2) .. " "
    end
    return s .. '\n' .. string.rep("   ", math.max((i or 0)-1, 0)) .. '}'
end

function utils.pretty_print(o)
    local o_mt = {}

    function o_mt:__tostring()
        return pretty_print_wrapper(self, 1)
    end

    setmetatable(o, o_mt)
end

function utils.pretty_print_table() 
    local o = {}
    utils.pretty_print(o)

    return o
end

return utils