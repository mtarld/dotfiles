local map = require("core.utils").map

-- global
map("n", "<leader>qq", ":xa!<CR>")

-- windows
map("n", "<leader>w/", ":vsp<CR>")
map("n", "<leader>w_", ":sp<CR>")
map("n", "<leader>wd", "<C-w>q")
map("n", "<leader>wh", "<C-w>h")
map("n", "<leader>wj", "<C-w>j")
map("n", "<leader>wk", "<C-w>k")
map("n", "<leader>wl", "<C-w>l")
map("n", "<leader>wm", ":MaximizerToggle<CR>")

-- buffers
map("n", "<leader>b<TAB>", ":lua require('custom.plugins.buffer').switch_to_last_buffer()<CR>")
map("n", "<leader>bx", ":Scratch<CR>")
map("n", "<leader>px", ":e" .. vim.fn.stdpath "config" .. "/lua/custom/plugins/buffer/projects.md<CR>")
map("n", "<leader>bo", ":silent! w|%bd|e#|bd#<CR>")

-- files
map("n", "<leader>fr", ":Telescope oldfiles<CR>")

-- git
map("n", "<leader>gg", ":Git<CR>")
map("n", "<leader>gf", ":diffget //2<CR>")
map("n", "<leader>gh", ":diffget //3<CR>")
map("n", "<leader>gb", ":Telescope git_branches<CR>")
map("n", "<leader>gc", ":Telescope git_commits<CR>")
map("n", "<leader>gl", ":Telescope git_bcommits<CR>")
map("n", "<leader>gn", ":lua require('gitsigns').next_hunk()<CR>")
map("n", "<leader>gN", ":lua require('gitsigns').prev_hunk()<CR>")
map("n", "<leader>gs", ":lua require('gitsigns').stage_hunk()<CR>")
map("n", "<leader>gu", ":lua require('gitsigns').undo_stage_hunk()<CR>")
map("n", "<leader>gS", ":lua require('gitsigns').stage_buffer()<CR>")
map("n", "<leader>gU", ":lua require('gitsigns').reset_buffer_index() <CR>")
map("n", "<leader>gr", ":lua require('gitsigns').reset_hunk()<CR>")
map("n", "<leader>gp", ":lua require('gitsigns').preview_hunk()<CR>")

-- lsp
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>")
map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
map("n", "gr", ":lua vim.lsp.buf.references()<CR>")
map("n", "K", ":lua vim.lsp.buf.hover()<CR>")
map("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>")
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
map("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>")
map("n", "<leader>D", ":lua vim.diagnostic.setloclist()<CR>")
map("n", "<leader>fm", ":lua vim.lsp.buf.formatting()<CR>")

-- search
map("n", "<leader>.", ":Telescope live_grep<CR>")
map("n", "<leader>/", ":lua require('telescope.builtin').live_grep({additional_args = function () return {'--no-ignore'} end})<CR>")
map("n", "<leader>§", ":Telescope live_grep_raw<CR>")
map("n", "<leader>ff", ":lua require('telescope').extensions.file_browser.file_browser({ path = require('custom.plugins.directory').buffer_dir() })<CR>")
map("n", "<leader>pp", ":Telescope project<CR>")
map("n", "<C-s>", ":Telescope current_buffer_fuzzy_find<CR>")
map("n", "<leader>bb", ":Telescope buffers<CR>")

-- directory
map("n", "<leader>oo", ":lua require('custom.plugins.directory').cwd_root()<CR>")
map("n", "<leader>o-", ":lua require('custom.plugins.directory').cwd_buffer()<CR>")
map("n", "<leader>^", ":lua require('custom.plugins.directory').cwd_parent()<CR>")

-- http
map("n", "<leader>hr", ":lua require('rest-nvim').run()<CR>")
