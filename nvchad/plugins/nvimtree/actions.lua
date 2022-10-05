local M = {}

local get_target_dir = function()
  local node = require("nvim-tree.lib").get_node_at_cursor()

  if not node then
    return require('custom.plugins.directory').root_dir()
  end

  local cwd = node.cwd or node.link_to or node.absolute_path
  if vim.fn.isdirectory(cwd) ~= 0 == false then
    cwd = node.parent.cwd or node.parent.link_to or node.parent.absolute_path
  end

  return cwd
end

M.live_grep = function()
  vim.cmd(string.format(
    "Telescope live_grep cwd=%s",
    get_target_dir()
  ))
end

return M

