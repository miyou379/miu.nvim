local keymap = vim.keymap
local function cmd(command)
   return table.concat({ '<Cmd>', command, '<CR>' })
end
-- local g = vim.g

--Telescope
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})

--DAP
keymap.set('n', '<F5>', function() require('dap').continue() end)
keymap.set('n', '<F10>', function() require('dap').step_over() end)
keymap.set('n', '<F11>', function() require('dap').step_into() end)
keymap.set('n', '<F12>', function() require('dap').step_out() end)
keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

--Windows
-- keymap.set('n', '<C-w>z', cmd 'WindowsMaximize')
-- keymap.set('n', '<C-w>_', cmd 'WindowsMaximizeVertically')
-- keymap.set('n', '<C-w>|', cmd 'WindowsMaximizeHorizontally')
-- keymap.set('n', '<C-w>=', cmd 'WindowsEqualize')

--LSP_Signature
keymap.set({ 'n' }, '<Leader>k', function()
    vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = 'toggle signature' })

--Neo-Tree
keymap.set('n', '<leader>t', cmd 'Neotree filesystem reveal right', { desc = 'NeoTree' })
keymap.set('n', '<leader>T', cmd 'Neotree filesystem reveal float', { desc = 'NeoTree(Float)' })
