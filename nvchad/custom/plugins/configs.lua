local M = {}

M.treesitter = {
   ensure_installed = {
      "css",
      "html",
      "javascript",
      "json",
      "markdown",
      "php",
   },
}

M.telescope = {
   pickers = {
     buffers = {
       sort_mru = true,
       ignore_current_buffer = true,
     },
   },
   extensions = {
     file_browser = {
       cwd_to_path = true,
     },
   },
}

return M

