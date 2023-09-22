# auto-fold-imports.nvim

Automatically fold imports in `*.js|ts` files.

## Installation

Installation with `lazy.nvim`

```
{
  "github-naresh/auto-fold-imports.nvim",
  event = { "BufReadPre", "BufNewFile"},
  config = true,
}
```
