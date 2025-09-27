return {
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/nvim-nio",
  "mfussenegger/nvim-dap",
  "leoluz/nvim-dap-go",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
  },
  {
    config = function()
      require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
      require("dap-go").setup()

      require("dap.ext.vscode").load_launchjs(nil, {})

      local dap = require("dap")

      vim.keymap.set("n", "<F5>", function()
        dap.continue()
      end)
      vim.keymap.set("n", "<Leader>dl", function()
        dap.run_last()
      end)

      vim.keymap.set("n", "<F10>", function()
        dap.step_over()
      end)
      vim.keymap.set("n", "<Leader><F10>", function()
        dap.step_out()
      end)
      vim.keymap.set("n", "<F9>", function()
        dap.step_into()
      end)
      vim.keymap.set("n", "<Leader>b", function()
        dap.toggle_breakpoint()
      end)
      vim.keymap.set("n", "<Leader>B", function()
        dap.set_breakpoint()
      end)
      vim.keymap.set("n", "<Leader>lp", function()
        dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end)

      vim.keymap.set("n", "<Leader>dd", function()
        dap.disconnect({ terminateDebuggee = true })
      end)

      local dap_ui = require("dapui")
      dap_ui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dap_ui.open()
      end

      vim.keymap.set("n", "<Leader>dt", function()
        dap_ui.toggle()
      end)

      require("dap-go").setup({
        dap_configurations = {
          {
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
          },
        },
        delve = {
          path = "dlv",
          initialize_timeout_sec = 20,
          port = "${port}",
          args = {},
        },
      })
    end,
  },
}
