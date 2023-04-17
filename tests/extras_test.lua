local extras = require("kosmos").extras

local i = 1
extras.clock.every_s(1).call_func(function () 
    print(i)
    i = i + 1
end)

extras.clock.execute_for_s(3)
