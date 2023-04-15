local kosmos = require("kosmos")
-- Creates a component type with one field called 'x' which must have a type of 'table'
local my_comp = kosmos.components.new("my_comp", {x = "table"})
-- This should obtain the type that was just created through its id
-- KOSMOS.components.get is equivalent to KOSMOS.components.new 
local my_comp_again = kosmos.components.get("my_comp")
-- Creates a component of type 'my_comp'
local my_comp_value = my_comp_again{x = {}}
-- Creates another component type that contains an element of type 'my_comp'
local my_comp_2 = kosmos.components.new("my_comp_2", {x = "my_comp", y = "string"})
-- Creates a component of type 'my_comp_2'
local my_comp_2_value = my_comp_2{x = my_comp_value, y = "foobar"}
-- Creates a component type with one field called 'c' which must have a type of 'string'
-- Spawn two entities with different components
kosmos.entities:spawn({kosmos.defaults.string_wrapper{c = "foo"}, my_comp_value, my_comp_2_value})
kosmos.entities:spawn({kosmos.defaults.string_wrapper{c = "bar"}})

kosmos.query{"str"}:then_call(function (q) 
    print("Calling function on query!")
    print(q)
end)
