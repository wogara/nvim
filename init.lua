local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.clipboard:append("unnamedplus")

require("vim-options")
require("lazy").setup("plugins")
local theme_file = vim.fn.stdpath("config") .. "/current_theme"
function _G.switch_theme(theme)
  local file = io.open(theme_file, "w")
  file:write(theme)
  file:close()

  if theme == "catppuccin" then
    require("catppuccin").setup({
      flavour = "mocha",
    })
    vim.cmd.colorscheme("catppuccin-mocha")
  elseif theme == "gruvbox" then
    require("gruvbox").setup({
      transparent_mode = false,
    })
    vim.cmd.colorscheme("gruvbox")
  elseif theme == "dracula" then
    require("dracula").setup({})
    vim.cmd.colorscheme("dracula")
  elseif theme == "tokyonight" then
    require("tokyonight").setup({})
    vim.cmd.colorscheme("tokyonight")
  else
    require("catppuccin").setup({
      flavour = "mocha",
    })
    vim.cmd.colorscheme("catppuccin-mocha")
  end
end

local file = io.open(theme_file, "r")
local initial_theme = file and file:read("*all") or "catppuccin"
if file then
  file:close()
end

initial_theme = initial_theme:gsub("%s+", "")

switch_theme(initial_theme)
