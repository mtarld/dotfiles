local M = {}

M.compare = function()
  vim.ui.input({ prompt = 'Compare with (master): ' }, function(input)
    local branch = input or "master"
    vim.cmd("Gvsplit " .. branch .. ":%")
  end)
end

return M
