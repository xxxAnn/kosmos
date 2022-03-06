local exports = {}

exports.parseType = function(s) -- s: String 
    -- parse s type
    --[[
        {
            list: boolean
            dict: boolean
            primitive: boolean # one and only one of these three conditionals must be true
            values?: table # if dict
            keys?: table # if list || dict
        }
    ]]--
end