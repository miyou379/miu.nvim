return {
    {
        'akinsho/bufferline.nvim',
        version = 'v3.*',
        after = {
            "catppuccin",
        --     "rose-pine",
        },
        event = 'ColorScheme',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('bufferline').setup({
                -- highlights = require('rose-pine.plugins.bufferline'),
                highlights = require("catppuccin.groups.integrations.bufferline").get(),
                options = {
                    separator_style = "padded_slant",
                    diagnostics = 'nvim_lsp',
                    -- offsets = {{
                    --     filetype = "filesystem",
                    --     text = "NeoTree",
                    --     highlight = "Directory",
                    --     text_align = "left",
                    -- }},
                },
            })
        end,
    },
}
