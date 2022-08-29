local M = {}

local get_target_dir = function(finder)
  local entry_path
  if finder.files == false then
    local entry = require("telescope.actions.state").get_selected_entry()
    entry_path = entry and entry.value
  end
  return finder.files and finder.path or entry_path
end

M.live_grep = function(prompt_bufnr, no_ignore)
  local finder = require("telescope.actions.state").get_current_picker(prompt_bufnr).finder
  require("telescope.builtin").live_grep({
    cwd = get_target_dir(finder),
    no_ignore = no_ignore or false,
  })
end

return M
