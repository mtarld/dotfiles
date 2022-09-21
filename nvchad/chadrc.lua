local M = {}

M.ui = {
  theme = "one_light",
  hl_override = require("custom.highlights").overriden_hlgroups,
}

M.plugins = require("custom.plugins")
M.mappings = require("custom.mappings")

return M
