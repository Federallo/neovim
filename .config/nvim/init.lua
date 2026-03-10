--linking luas files/directories
require('plugins')
require('plugins-configs')

--adding extra stuff
vim.wo.number = true
vim.opt.termguicolors = true

vim.opt.shiftwidth = 2    -- Dimensione dell'indentazione automatica
vim.opt.tabstop = 2       -- Quanti spazi occupa visivamente un carattere TAB
vim.opt.softtabstop = 2   -- Quanti spazi inserisce/rimuove il tasto TAB/Backspace
vim.g.copilot_enabled = false -- Disabilita Copilot per tutti i file (si può abilitare con :Copilot enable)
vim.opt.cursorline = true -- Evidenzia la linea intera
