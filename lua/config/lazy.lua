-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "catppuccin-nvim" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.cmd.colorscheme "catppuccin-nvim"

vim.g.netrw_liststyle = 1
vim.g.neovide_fullscreen = true

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

vim.opt.laststatus = 0
vim.opt.cursorline = false
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"

-- Relative + current line numbers
vim.wo.relativenumber = true
vim.wo.number = true

-- Set conceal level for obsidian plugin
vim.wo.conceallevel = 1


vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = "NONE" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	command = "setlocal nocursorline",
})

