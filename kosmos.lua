-- Copyright (C) 2023 Ann Mauduy-Decius

local KOSMOS = {}

KOSMOS.components = require("src/components")
KOSMOS.entities = require("src/pool")
KOSMOS.query = require("src/query")
KOSMOS.consts = require("src/consts")
KOSMOS.extras = require("src/extras/mod")
KOSMOS.defaults = KOSMOS.extras.defaults


return KOSMOS
