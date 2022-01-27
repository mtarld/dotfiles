local M = {}

local function get_buffers(ignore_current_buffer) -- TODO exclude terminal buffer
  return vim.tbl_filter(function(b)
    if 1 ~= vim.fn.buflisted(b) then
      return false
    end

    if ignore_current_buffer and b == vim.api.nvim_get_current_buf() then
      return false
    end

    return true
  end, vim.api.nvim_list_bufs())
end

local function get_last_buffer()
  buffers = get_buffers{ignore_current_buffer=true}

  table.sort(buffers, function(a, b)
    return vim.fn.getbufinfo(a)[1].lastused > vim.fn.getbufinfo(b)[1].lastused
  end)

  return buffers[1];
end

local function switch_to_last_buffer()
  last_buffer = get_last_buffer()
  if nil ~= last_buffer then
    vim.cmd("b" .. get_last_buffer())
  end
end

return {
  switch_to_last_buffer = switch_to_last_buffer,
}

