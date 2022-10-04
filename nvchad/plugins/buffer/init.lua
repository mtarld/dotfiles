local M = {}

M.get_buffers = function (ignore_current_buffer, sort_mru)
  local buffers = vim.tbl_filter(
    function (b)
      if 1 ~= vim.fn.buflisted(b) then
        return false
      end

      if (ignore_current_buffer or false) and b == vim.api.nvim_get_current_buf() then
        return false
      end

      return true
    end,
    vim.api.nvim_list_bufs() or {}
  )

  if not next(buffers) then
    return {}
  end

  if (sort_mru or false) then
    table.sort(buffers, function(a, b)
      return vim.fn.getbufinfo(a)[1].lastused > vim.fn.getbufinfo(b)[1].lastused
    end)
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
    vim.cmd(string.format("b %s", last_buffer))
  end
end

M.close_other_buffers = function()
  local bufdelete = require('bufdelete')

  for _, buf in ipairs(M.get_buffers{ignore_current_buffer=true}) do
    bufdelete.bufdelete(buf)
  end
end

return M
