--[[
    nodes is:
    table 
    {
        v = x,
        next = {
            v = x,
            next = {
                v = x,
                next = nil
            }
        }
    }
]]--
return setmetatable({}, {__call = function(...)

end})