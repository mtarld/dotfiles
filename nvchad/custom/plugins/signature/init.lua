local present, lspsignature = pcall(require, "lsp_signature")

if present then
   lspsignature.setup {
      bind = true,
      doc_lines = 0,
      floating_window = true,
      fix_pos = true,
      hint_enable = false,
      hi_parameter = "Search",
      max_height = 22,
      max_width = 120,
      handler_opts = {
         border = "single",
      },
      zindex = 200,
      padding = "",
   }
end
