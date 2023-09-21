# auto-fold-imports.nvim

Automatically fold imports in `*.js|ts` files.

## Installation

Installation with `lazy.nvim`

```
{
  "github-naresh/auto-fold-imports.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local auto_fold = require("auto-fold-imports.nvim")
    local augroup = vim.api.nvim_create_augroup("AutoFoldImports", {})
    vim.api.nvim_clear_autocmds({ group = augroup })
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      group = augroup,
      callback = function()
        auto_fold.setup()
      end,
    })
  end,
}
```
