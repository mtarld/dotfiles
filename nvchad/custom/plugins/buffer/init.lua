local M = {}

M.get_buffers = function(ignore_current_buffer)
  local buffers = require("core.utils").bufilter() or {}

  if ignore_current_buffer then
    for i = #buffers, 1, -1 do
      if buffers[i] == vim.api.nvim_get_current_buf() then
        table.remove(buffers, i)
      end
    end
  end

  return buffers
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
    vim.cmd("b" .. last_buffer)
  end
end

return M
