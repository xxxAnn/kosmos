return setmetatable({}, {__call = function()
    local headnode = {VAL = nil, NEXT = nil}
    function GetNodeAtIndex(t,k, stopifnil)
        if k == 1 then
            return t
        end
        local cnode = t
        for x=2,k do
            if rawget(cnode, "NEXT") ~= nil then
                cnode = rawget(cnode, "NEXT")
            else 
                if stopifnil then
                    return nil
                end
                rawset(cnode, "NEXT", {VAL = nil, NEXT = nil})
                cnode = rawget(cnode, "NEXT")
            end
        end
        return cnode
    end
    return setmetatable(headnode, {
        __newindex=function (t,k,v)
            rawset(GetNodeAtIndex(t,k), "VAL", v)
        end,
        __index=function (t,k)
            return rawget(GetNodeAtIndex(t,k, true), "VAL")
        end,
    })
end})

