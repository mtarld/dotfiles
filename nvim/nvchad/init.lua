local autocmd = vim.api.nvim_create_autocmd

-- Highlight yanked text
autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "Visual",
      timeout = 120,
    })
  end,
})

-- Enable spellchecking in markdown, text and gitcommit files
autocmd("FileType", {
   pattern = { "gitcommit", "markdown", "text" },
   callback = function()
      vim.opt_local.spell = true
   end,
})

vim.opt.relativenumber = true

-- Open dashboard when every buffers are closed
autocmd("User", {
  pattern = "BDeletePost*",
  callback = function(event)
    local fallback_name = vim.api.nvim_buf_get_name(event.buf)
    local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
    local fallback_on_empty = fallback_name == "" and fallback_ft == ""

    if fallback_on_empty then
      vim.cmd("Dashboard")
    end
  end,
})
