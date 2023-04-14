-- This creates special types without using the src/types/types API.
-- This is to avoid self-reference problems within the src/types/types API.

local special_types = {}

local error_wat_mt = {}
local error_wrong_argument_type = {}

function error_wat_mt:__call(arg)
    local o = {}

    o.__type = "error_wat" -- Special marker
    for k, v in pairs({expected = "string", got = "string", key = "string", fname = "string"}) do
        if type(arg[k]) == v and k ~= "__type" then
            o[k] = arg[k]
        else 
            local err = error_wrong_argument_type{expected = v, got = type(arg[k]), key = k, fname = "error_wrong_argument_type constructor"}
            err:err()
        end
    end

    function o:err()
        return error(string.format("Expected key '%s' to be of type %s in call to '%s'. Got object of type %s.", self.key, self.expected, self.fname, self.got))
    end

    return o
end

setmetatable(error_wrong_argument_type, error_wat_mt)
special_types.errors = {wrong_argument_type = error_wrong_argument_type}

return special_types