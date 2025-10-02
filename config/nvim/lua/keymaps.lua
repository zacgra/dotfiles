vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostics
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = '[D]iagnostic [Q]uickfix list' })

-- Buffer operations
vim.keymap.set('n', '<leader>bd', '<cmd>bd<cr>', { desc = '[B]uffer [D]elete' })
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>', { desc = '[B]uffer [N]ext' })
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<cr>', { desc = '[B]uffer [P]revious' })

-- Window operations
vim.keymap.set('n', '<leader>wv', '<cmd>vsplit<cr>', { desc = '[W]indow Split [V]ertical' })
vim.keymap.set('n', '<leader>wh', '<cmd>split<cr>', { desc = '[W]indow Split [H]orizontal' })
vim.keymap.set('n', '<leader>wc', '<cmd>close<cr>', { desc = '[W]indow [C]lose' })
vim.keymap.set('n', '<leader>wo', '<cmd>only<cr>', { desc = '[W]indow [O]nly (close others)' })
vim.keymap.set('n', '<leader>wr', '<cmd>resize<cr>', { desc = '[W]indow [R]esize' })

-- Quit/Session
vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = '[Q]uit all' })
vim.keymap.set('n', '<leader>qw', '<cmd>wqa<cr>', { desc = '[Q]uit all and [W]rite' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
