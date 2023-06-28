-- DAP-python github.com/mfussenegger/nvim-dap and github.com/mfussenegger/nvim-dap-python
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

-- Use the .vscode/launch.json file to configure debugger
require('dap.ext.vscode').load_launchjs(nil, {})

local dap = require('dap')

-- Start session
vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)

-- Breakpoints, stepping, etc
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<Leader><F10>', function() dap.step_out() end)
vim.keymap.set('n', '<F9>', function() dap.step_into() end)
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)

-- End the debug session
vim.keymap.set('n', '<Leader>dd', function() dap.disconnect( {terminateDebuggee = true } ) end)

-- DAP ui package github.com/rcarriga/nvim-dap-ui
local dap_ui = require('dapui')
dap_ui.setup()

-- Toggle the UI when a session starts or ends
dap.listeners.after.event_initialized["dapui_config"] = function()
  dap_ui.open()
end

-- Manually toggle the UI
vim.keymap.set('n', '<Leader>dt', function() dap_ui.toggle() end)
