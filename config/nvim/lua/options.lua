vim.o.number = true -- Line numbers
vim.o.mouse = 'a' -- Enable mouse
vim.o.showmode = false -- Don't show mode in command line

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus' -- Sync with system clipboard
end)

vim.o.breakindent = true -- Wrap indent to match line start
vim.o.undofile = true -- Persistent undo history

vim.o.ignorecase = true -- Case-insensitive search
vim.o.smartcase = true -- ...unless search has capitals

vim.o.signcolumn = 'yes' -- Always show sign column
vim.o.updatetime = 250 -- Faster completion
vim.o.timeoutlen = 300 -- Faster key sequence timeout
vim.o.splitright = true -- Vertical splits to the right
vim.o.splitbelow = true -- Horizontal splits below

vim.o.list = true -- Show whitespace characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.inccommand = 'split' -- Preview substitutions live
vim.o.cursorline = true -- Highlight cursor line
vim.o.scrolloff = 10 -- Lines to keep above/below cursor
vim.o.confirm = true -- Confirm before closing unsaved buffers

vim.opt.autoread = true

vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  pattern = '*',
  callback = function()
    vim.notify('File changed on disk. Buffer reloaded.', vim.log.levels.WARN)
  end,
})

-- Notification after file change
vim.api.nvim_create_autocmd('FileChangedShellPost', {
  pattern = '*',
  callback = function()
    vim.notify('File changed on disk. Buffer reloaded.', vim.log.levels.WARN)
  end,
})
