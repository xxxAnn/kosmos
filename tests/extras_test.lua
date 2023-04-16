local extras = require("kosmos").extras

extras.clock.every_s(1).call_func(function () 
    print("TEST")
end)

extras.clock.execute_for_s(3)
