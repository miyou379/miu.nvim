return {
    {
        "numToStr/Comment.nvim",
        config = function ()
            require'Comment'.setup({
                opleader = {
                    ---Line-comment keymap
                    line = 'gc',
                    ---Block-comment keymap
                    block = 'gb',
                },
                mappings = {
                    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                    basic = true,
                    ---Extra mapping; `gco`, `gcO`, `gcA`
                    extra = false,
                },
            })
        end,
    },
}
