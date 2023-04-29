return {
    {
        -- Make sure that you have installed delve
        -- and it's in your PATH, if not,
        --go install github.com/go-delve/delve/cmd/dlv@latest
        "leoluz/nvim-dap-go",
        config = function()
            require('dap-go').setup {
                -- Additional dap configurations can be added.
                -- dap_configurations accepts a list of tables where each entry
                -- represents a dap configuration. For more details do:
                -- :help dap-configuration
                dap_configurations = {
                    {
                      -- Must be "go" or it will be ignored by the plugin
                      type = "go",
                      name = "Attach remote",
                      mode = "remote",
                      request = "attach",
                    },
                },
                 -- delve configurations
                 delve = {
                    -- time to wait for delve to initialize the debug session.
                    -- default to 20 seconds
                    initialize_timeout_sec = 20,
                    -- a string that defines the port to start delve debugger.
                    -- default to string "${port}" which instructs nvim-dap
                    -- to start the process in a random available port
                    port = "${port}"
                },
            }
        end,
    },

    {
        -- Make sure that you have installed debugpy
        -- in virtualenv, if not ,exect this and DO NOT
        -- CHANGE ANYTHING, before this you need to install
        -- pythonvenv, exect in not ROOT
        --cd
        --mkdir .virtualenvs
        --cd .virtualenvs
        --python3 -m venv debugpy
        --debugpy/bin/python3 -m pip install debugpy
        "mfussenegger/nvim-dap-python",
        config = function()
            require('dap-python').setup('~/.virtualenvs/debugpy/bin/python3')
        end,
    },

    {
        "mfussenegger/nvim-dap",
        config = function()
            -- You NEED to override nvim-dap's default highlight groups, AFTER requiring nvim-dap
            local dap = require('dap')
            require("dap")
            local dap_breakpoint_color = {
                breakpoint = {
                    ctermbg=0,
                    fg='#993939',
                    bg='#31353f',
                },
                logpoing = {
                    ctermbg=0,
                    fg='#61afef',
                    bg='#31353f',
                },
                stopped = {
                    ctermbg=0,
                    fg='#98c379',
                    bg='#31353f'
                },
            }

            vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
            vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoing)
            vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)

            local dap_breakpoint = {
                error = {
                    text = "",
                    texthl = "DapBreakpoint",
                    linehl = "DapBreakpoint",
                    numhl = "DapBreakpoint",
                },
                condition = {
                    text = 'ﳁ',
                    texthl = 'DapBreakpoint',
                    linehl = 'DapBreakpoint',
                    numhl = 'DapBreakpoint',
                },
                rejected = {
                    text = "",
                    texthl = "DapBreakpint",
                    linehl = "DapBreakpoint",
                    numhl = "DapBreakpoint",
                },
                logpoint = {
                    text = '',
                    texthl = 'DapLogPoint',
                    linehl = 'DapLogPoint',
                    numhl = 'DapLogPoint',
                },
                stopped = {
                    text = '',
                    texthl = 'DapStopped',
                    linehl = 'DapStopped',
                    numhl = 'DapStopped',
                },
            }

            vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
            vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
            vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
            vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
            vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)

            -- Configuration for gdb-cpptools for C/C++/Rust,
            -- Make sure that you have installed cpptools,
            -- github.com/microsoft/vscode-cpptools/releases
            -- and don't forget to change the config to your
            -- own directory of cpptools
            dap.adapters.cppdbg = {
                id = 'cppdbg',
                type = 'executable',
                -- CHANGE TO YOUR OWN PATH TO cpptools
                command = '/home/rin/Download/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
            }
            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopAtEntry = true,
                },
                -- {
                --     name = 'Attach to gdbserver :${port}',
                --     type = 'cppdbg',
                --     request = 'launch',
                --     MIMode = 'gdb',
                --     miDebuggerServerAddress = 'localhost:1234',
                --     miDebuggerPath = '/usr/bin/gdb',
                --     cwd = '${workspaceFolder}',
                --     program = function()
                --       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                --     end,
                -- },
            }
            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp
        end,
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = "theHamsta/nvim-dap-virtual-text",
        config = function()
            local dapui = require("dapui")
            dapui.setup({})

            local dap = require("dap")
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open({})
            end

            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close({})
            end


            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close({})
            end

            require("nvim-dap-virtual-text").setup({
                enabled = true,
                enable_commands = true,
                highlight_changed_variables = true,
                highlight_new_as_changed = false,
                show_stop_reason = true,
                commented = false,
                only_first_definition = true,
                all_references = false,
                filter_references_pattern = '<module',
                virt_text_pos = 'eol',
                all_frames = false,
                virt_lines = false,
                virt_text_win_col = nil
            })
        end,
    },
}
