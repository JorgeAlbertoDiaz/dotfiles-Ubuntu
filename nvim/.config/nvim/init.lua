pcall(require, 'impatient')

if require 'jorge.first_load' () then
	return
end

require 'jorge.globals'
vim.g.mapleader = " "

require 'jorge.plugins'
require 'jorge.plugins.telescope-setup'
require 'jorge.plugins.nvim-web-devicons-setup'
require 'jorge.plugins.nvim-tree-setup'

require 'jorge.mappings'
