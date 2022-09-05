local M = {}

M.get_buffers = function(ignore_current_buffer)
  return vim.tbl_filter(function(b)
    if 1 ~= vim.fn.buflisted(b) then
      return false
    end

    if not vim.api.nvim_buf_is_loaded(b) then
      return false
    end

    if ignore_current_buffer and b == vim.api.nvim_get_current_buf() then
      return false
    end

    return true
  end, vim.api.nvim_list_bufs() or {})
end

M.get_last_buffer = function()
  local buffers = M.get_buffers{ignore_current_buffer=true}

  table.sort(buffers, function(a, b)
    return vim.fn.getbufinfo(a)[1].lastused > vim.fn.getbufinfo(b)[1].lastused
  end)

  return buffers[1];
end

M.switch_to_last_buffer = function()
  local last_buffer = M.get_last_buffer()

  if nil ~= last_buffer then
    vim.cmd(string.format("b %s", last_buffer))
  end
end

M.close_other_buffers = function()
  for _, buf in ipairs(M.get_buffers(true)) do
    vim.cmd(string.format("bd %s", buf))
  end
end

return M
