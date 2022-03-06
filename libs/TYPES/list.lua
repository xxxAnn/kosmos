return setmetatable({}, {__call = function(...)
    local t = {...}
    function t:push(v) 
        table.insert(self, v)
    end
    function t:pop()
        local v = t[#t]
        t[#t] = nil
        return v
    end
    t.__list = true
    return t
end})