-- <MOD>
local MOD_escmeta = {}

MOD_escmeta.ENVMETA = {
    __newindex = function (t,k,v)
        local x = type(v)
        if x == "function" then
            --# STORE IN SYSTEM POOL
        elseif x == "table" then
            
        end
    end
}
--[[
==================================================================
CRUD COMPONENTs:

local MyComponent = {
    n = "number",
    k = "string"
}

local MyOtherComponent = {
    a = "number",
    b = "number"
}
==================================================================
CRUD ENTITYs:

local my_first_entity = entity(MyComponent(3, "hello"), MyOtherComponent(4, 5))

local my_other_entity = entity() -- The empty entity is simply `nil`

    > my_other_entity == nil
    true
==================================================================
CRUD SYSTEMs:

function mysystem(KOS, arg1, arg2) {
    if KOS ~= "SCHEME" then      
        --// Some system logic here
    else 
        return {
            MyComponent,
            MyOtherComponent
        } --// This system works on any pair of (MyComponent, MyOtherComponent)
    end
end
}

NOTE: Systems must make sure to return a list of their argument's component 
type when the first argument passed is "SCHEME", otherwise the first argument
will contain metadata generally about the caller thread, the other arguments
will be what was returned as the "SCHEME".
==================================================================
]]--

return MOD_escmeta
-- </MOD>