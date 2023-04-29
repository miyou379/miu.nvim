return {
    {
        -- Unless you are still migrating, remove the deprecated commands from v1.x
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
        },
        config = function()
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
        end,
    },
}
