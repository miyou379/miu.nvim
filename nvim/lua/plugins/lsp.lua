-- This is the configuration file of 
-- nvim-lspconfig, setup LSPs here
return {
    {
        "neovim/nvim-lspconfig",
        config = function()
        -- Configuration of nvim-lspconfig
        -- Make sure you have installed
        -- these LSP first, if not, follow
        -- github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

            --go install golang.org/x/tools/gopls@latest
            require'lspconfig'.gopls.setup {}
            --pip install pyright
            require'lspconfig'.pyright.setup {}
            require'lspconfig'.ccls.setup {} -- by pack
            -- github.com/LuaLS/lua-language-server/wiki/Getting-Started#command-line
			require'lspconfig'.lua_ls.setup {
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
							version = 'LuaJIT',
				 		},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = {'vim'},
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							-- Do not send telemetry data containing a randomized but unique identifier
							enable = false,
						},
					},
				},
			}
            -- rust-analyzer.github.io
            require'lspconfig'.rust_analyzer.setup {}
        end,
    },

}
