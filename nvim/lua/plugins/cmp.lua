return {
    -- nvim-autopairs
    {
        "windwp/nvim-autopairs",
        config = function()
            require'nvim-autopairs'.setup {
                -- map_bs = false,
                map_c_h = false,
                map_c_w = false,
                enable_check_bracket_line = false,
            }
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            require'cmp'.event:on(
              'confirm_done',
              cmp_autopairs.on_confirm_done()
            )
        end,
    },

    -- nvim-cmp settings
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { 'hrsh7th/cmp-vsnip' },
            { 'hrsh7th/vim-vsnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
        },
        config = function()
        local cmp = require'cmp'
        cmp.setup({
            snippet = {
              -- REQUIRED - you must specify a snippet engine
              expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
              end,
            },
            window = {
              -- completion = cmp.config.window.bordered(),
              -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              [';'] = cmp.mapping.abort(),
              -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'vsnip' }, -- For vsnip users.
            }, {
              { name = 'buffer' },
            }),
          })

          -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
          cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = 'buffer' }
            }
          })

          -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
          cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
              { name = 'path' }
            }, {
              { name = 'cmdline' }
            })
          })

          -- Set up lspconfig.
          local capabilities = require('cmp_nvim_lsp').default_capabilities()
          -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
          require('lspconfig').ccls.setup {
            capabilities = capabilities
          }
          require('lspconfig').gopls.setup {
            capabilities = capabilities
          }
          require('lspconfig').pyright.setup {
            capabilities = capabilities
          }
          require('lspconfig').lua_ls.setup {
            capabilities = capabilities
          }
          require('lspconfig').rust_analyzer.setup {
            capabilities = capabilities
          }
        end,
    },
}
