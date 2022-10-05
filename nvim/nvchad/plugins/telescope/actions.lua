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

M.live_grep = function(prompt_bufnr, opts)
  local rg_args = {
    "rg",
    "--color=never",
    "--no-heading",
    "--with-filename",
    "--line-number",
    "--column",
    "--smart-case",
  }

  if opts.unrestricted == true then
    rg_args[#rg_args+1] = "-uu"
  end

  local live_grep_opts = {
    string.format("vimgrep_arguments=%s", table.concat(rg_args, ','))
  }

  if prompt_bufnr ~= nil then
    live_grep_opts[#live_grep_opts+1] = string.format("cwd=%s", get_target_dir(prompt_bufnr))
  end

  vim.cmd(string.format(
    "Telescope live_grep %s",
    table.concat(live_grep_opts, ' ')
  ))
end

M.delete_buffer = function(prompt_bufnr)
  local action_state = require("telescope.actions.state")
  local current_picker = action_state.get_current_picker(prompt_bufnr)

  current_picker:delete_selection(function(selection)
    local force = vim.api.nvim_buf_get_option(selection.bufnr, "buftype") == "terminal"
    require("bufdelete").bufdelete(selection.bufnr, force)
  end)
end

return M
