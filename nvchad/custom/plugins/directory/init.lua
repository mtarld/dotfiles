local M = {}

local function cwd(path)
  vim.cmd("cd " .. path)
end

local function buffer_directory()
  return vim.fn.expand("%:p:h")
end

local function root_directory()
  local cmd = "git -C " .. vim.fn.shellescape(vim.fn.expand("%:p:h")) .. " rev-parse --show-toplevel"
  local toplevel = vim.fn.system(cmd)

  if not toplevel or #toplevel == 0 or toplevel:match("fatal") then
    return nil
  end

  return toplevel:sub(0, -2)
end

local function parent_directory()
  return vim.fn.getcwd() .. "/../"
end

local function cwd_root()
  cwd(root_directory())
end

local function cwd_buffer()
  cwd(buffer_directory())
end

local function cwd_parent()
  cwd(parent_directory())
end

return {
  root_dir = root_directory,
  buffer_dir = buffer_directory,
  parent_dir = parent_directory,
  cwd_root = cwd_root,
  cwd_buffer = cwd_buffer,
  cwd_parent = cwd_parent,
}
