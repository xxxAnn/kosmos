local kosmos = require("kosmos")
-- creates a type with one field called 'x' which must have a type of 'table'
local my_type = kosmos.types("my_type", {x = "table"})
-- This should obtain the type that was just created through its id
local my_type_again = kosmos.types("my_type")
-- This should error, as the table's type is set to 'wrong_type' instead of 'table'
local my_type_value = my_type_again{x = {__type = "wrong_type"}}

