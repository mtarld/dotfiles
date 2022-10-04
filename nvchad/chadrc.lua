local M = {}

local highlights = require("custom.highlights")

M.ui = {
  theme = "one_light",
  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = require("custom.plugins")
M.mappings = require("custom.mappings")

return M
