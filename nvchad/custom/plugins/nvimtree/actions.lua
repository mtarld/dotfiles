local M = {}

local get_target_dir = function()
  local node = require("nvim-tree.lib").get_node_at_cursor()

  if not node then
    return nil
  end

  local cwd = node.cwd or node.link_to or node.absolute_path
  if vim.fn.isdirectory(cwd) ~= 0 == false then
    cwd = node.parent.cwd or node.parent.link_to or node.parent.absolute_path
  end

  return cwd
end

M.live_grep = function(no_ignore)
  local cwd = get_target_dir()
  if cwd == nil then
    return
  end

  require("telescope.builtin").live_grep({
    cwd = cwd,
    no_ignore = no_ignore or false,
  })
end

return M

