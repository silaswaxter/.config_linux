-- Editor UX
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.listchars = {tab = " "}
vim.opt.list = true
vim.opt.spell = true

-- File Config (style-guide)
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.encoding = "utf-8"
vim.opt.colorcolumn = "79"
vim.opt.textwidth = 79
--[[
Currently disabled because its getting in the way of editing my i3 config. It 
keeps forcing the wrapping of a line which cannot be wrapped.  TODO: make this 
feature work good.
--]]
--vim.opt.formatoptions = "twa"


