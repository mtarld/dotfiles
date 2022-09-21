local M = {}

local get_target_dir = function(prompt_bufnr)
  local finder = require("telescope.actions.state").get_current_picker(prompt_bufnr).finder
  local entry_path
  if finder.files == false then
    local entry = require("telescope.actions.state").get_selected_entry()
    entry_path = entry and entry.value
  end
  return finder.files and finder.path or entry_path
end

M.live_grep = function(prompt_bufnr, no_ignore)
  vim.cmd(string.format(
    "Telescope live_grep no_ignore=%s cwd=%s",
    tostring(no_ignore or false),
    get_target_dir(prompt_bufnr)
  ))
end

return M
