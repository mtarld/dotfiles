require("custom.mappings")
require("custom.plugins")

vim.opt.rtp:append(vim.fn.stdpath "config" .. "/lua/custom/runtime/after")
