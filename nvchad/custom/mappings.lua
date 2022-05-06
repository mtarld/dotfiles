local map = require("core.utils").map

-- global
map("n", "<leader>qq", ":xa!<CR>")
map("n", "<leader>fs", "<cmd> :w<CR>")

-- windows
map("n", "<leader>x/", ":vsp<CR>")
map("n", "<leader>x_", ":sp<CR>")
map("n", "<leader>xx", "<C-w>q")

-- buffers
map("n", "<leader>b<TAB>", function()
  require('custom.plugins.buffer').switch_to_last_buffer()
end)
map("n", "<leader>bx", ":Scratch<CR>")
map("n", "<leader>px", ":e" .. vim.fn.stdpath "config" .. "/lua/custom/plugins/buffer/projects.md<CR>")
map("n", "<leader>bo", ":silent! w|%bd|e#|bd#<CR>")
map("n", "<leader>bd", function()
  require("core.utils").close_buffer()
end)

-- directory
map("n", "<leader>oo", ":lua require('custom.plugins.directory').cwd_root()<CR>")
map("n", "<leader>o-", ":lua require('custom.plugins.directory').cwd_buffer()<CR>")
map("n", "<leader>^", ":lua require('custom.plugins.directory').cwd_parent()<CR>")
