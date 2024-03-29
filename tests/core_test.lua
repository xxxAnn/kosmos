local kosmos = require("kosmos")
local extras = kosmos.extras
-- Creates a component type with one field called 'x' which must have a type of 'table'
local my_comp = kosmos.components.new("my_comp", {x = "position2D"})
-- This should obtain the type that was just created through its id
-- KOSMOS.components.get is equivalent to KOSMOS.components.new 
local my_comp_again = kosmos.components.get("my_comp")
-- Creates a component of type 'my_comp'
local my_comp_value = my_comp_again{x = kosmos.components.get("position2D")(3, 4)}
-- Creates another component type that contains an element of type 'my_comp'
local my_comp_2 = kosmos.components.new("my_comp_2", {x = "my_comp", y = "string"})
-- Creates a component of type 'my_comp_2'
local my_comp_2_value = my_comp_2{x = my_comp_value, y = "foobar"}
-- Creates a component type with one field called 'c' which must have a type of 'string'
-- Spawn two entities with different components
kosmos.entities:spawn({extras.defaults.wrap("foo"), my_comp_value, my_comp_2_value})
kosmos.entities:spawn({extras.defaults.wrap(3), extras.defaults.wrap("foo")})

kosmos.query{"str"}:then_call(function (q) 
    print("Calling function on query!")
    print(q)
end)