-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("colorscheme rose-pine-main")
function Transparent()
  color = color or "rose-pine-main" or "catppuccin-mocha"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
  hi StatusLine guibg=NONE ctermbg=NONE
  hi StatusLineNC guibg=NONE ctermbg=NONE
  hi VertSplit guibg=NONE ctermbg=NONE
  hi TabLine guibg=NONE ctermbg=NONE
  hi TabLineFill guibg=NONE ctermbg=NONE
  hi TabLineSel guibg=NONE ctermbg=NONE
  hi Pmenu guibg=NONE ctermbg=NONE
  hi PmenuSel guibg=NONE ctermbg=NONE
  hi NeoTreeNormal guibg=NONE ctermbg=NONE
  hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
  hi NeoTreeWinSeparator guibg=NONE ctermbg=NONE
  ]])
end
Transparent()

-- vim.cmd("colorscheme catppuccin-mocha")
-- vim.cmd("colorscheme kanagawa-dragon")
-- vim.cmd("colorscheme embark")
-- vim.cmd("colorscheme tokyodark")
-- vim.cmd("colorscheme candyland")
-- vim.cmd("colorscheme ethereal.nvim")
