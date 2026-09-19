vim.g.mapleader = " "

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
-- Spazio + k per andare al buffer successivo (destra)
vim.keymap.set("n", "<leader>k", ":bnext<CR>", { desc = "Passa al buffer successivo" })

-- Spazio + j per andare al buffer precedente (sinistra)
vim.keymap.set("n", "<leader>j", ":bprev<CR>", { desc = "Passa al buffer precedente" })

-- Premi 'Spazio + r' per ricaricare la configurazione senza chiudere Neovim
vim.keymap.set('n', '<Leader>r', function()
  vim.cmd('source $MYVIMRC')
  print('Configurazione ricaricata con successo!')
end, { desc = 'Ricarica configurazione Neovim' })

-- Mantieni la selezione Visual dopo aver spostato il testo con > o <
vim.keymap.set('v', '>', '>gv', { desc = 'Sposta a destra e mantieni selezione' })
vim.keymap.set('v', '<', '<gv', { desc = 'Sposta a sinistra e mantieni selezione' })
