local sep_style = vim.g.statusline_sep_style
local separators = (type(sep_style) == "table" and sep_style) or require("nvchad_ui.icons").statusline_separators[sep_style]
local sep_l = separators["left"]
local sep_r = separators["right"]

return {
  fileInfo = function()
    local icon = "  "
    local filename = (vim.fn.expand "%" == "" and "Empty ") or vim.fn.expand "%:F"

    if filename ~= "Empty " then
      local devicons_present, devicons = pcall(require, "nvim-web-devicons")

      if devicons_present then
        local ft_icon = devicons.get_icon(filename)
        icon = (ft_icon ~= nil and " " .. ft_icon) or ""
      end

      filename = " " .. filename .. " "
    end

    return "%#St_file_info#" .. icon .. filename .. "%#St_file_sep#" .. sep_r
  end,
  cwd = function()
    local dir_icon = "%#St_cwd_icon#" .. " "
    local dir_name = "%#St_cwd_text#" .. " " .. vim.fn.getcwd() .. " "
    return (vim.o.columns > 85 and ("%#St_cwd_sep#" .. sep_l .. dir_icon .. dir_name)) or ""
  end,
}
