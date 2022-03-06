local hash = require("UTILS/utils").hash
local linkedlist = require("TYPES/linkedlist")

return setmetatable({}, {__call = function()
    local t = 
    setmetatable(t, {
        __newindex = function (tab,k,v)
            local keyhash = hash(k)
        end,
        __index = function (tab,k) 
            local keyhash = hash(k)
        end
    })
    return t
end})

