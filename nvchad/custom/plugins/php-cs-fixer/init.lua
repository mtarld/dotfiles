local M = {}

local function is_file_readable(fname)
  local stat = vim.loop.fs_stat(fname)
  return stat and stat.type == "file" and vim.loop.fs_access(fname, 'R')
end

local function find_config_path()
  local config_path = vim.fn.getcwd() .. '/.php-cs-fixer.php'
  if is_file_readable(config_path) then
    return config_path
  end

  local config_path = vim.fn.getcwd() .. '/.php-cs-fixer.dist.php'
  if is_file_readable(config_path) then
    return config_path
  end

  local config_path = vim.fn.getcwd() .. '/tools/.php-cs-fixer.php'
  if is_file_readable(config_path) then
    return config_path
  end

  local config_path = vim.fn.getcwd() .. '/tools/.php-cs-fixer.dist.php'
  if is_file_readable(config_path) then
    return config_path
  end

  return '/home/mtarld/.config/nvim/lua/custom/plugins/php-cs-fixer/.php-cs-fixer.php'
end

M.format = function()
  local executable = 'php-cs-fixer'
  local config_path = find_config_path()
  local buffer = vim.fn.getcwd() .. '/' .. vim.fn.expand('%') 
  local command = executable .. ' fix ' .. buffer .. ' --quiet --config=' .. config_path

  vim.cmd('silent! !' .. command)
  vim.cmd('silent! e')
end

return M
