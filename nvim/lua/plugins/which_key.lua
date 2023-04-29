return {
	{
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 900
            require("which-key").setup({
                triggers_blacklist = {
                    -- list of mode / prefixes that should never be hooked by WhichKey
                    -- this is mostly relevant for keymaps that start with a native binding
                    i = { "j", "k", ";" },
                    v = { "j", "k", ";" },
                },
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            })

            -- Config hints of which-key``
            require("which-key").register({
                ["<leader>f"] = {
                    name = "Telescope",
                    f = ("Find Files"),
                    g = ("Live Grep"),
                    b = ("Buffers"),
                    h = ("Telescope Help"),
                },
                ["<leader>"] = {
                    w = ("Toggle Windows"),
                    h = ("Horizontal Split"),
                    v = ("Vertical Split"),
                    q = ("quit"),
                }
            })
        end,
	},
}
