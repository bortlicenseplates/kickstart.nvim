return {
    {
        -- autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- snippet engine & its associated nvim-cmp source
            'l3mon4d3/luasnip',
            'saadparwaiz1/cmp_luasnip',

            -- adds lsp completion capabilities
            'hrsh7th/cmp-nvim-lsp',

            -- adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',

            "onsails/lspkind-nvim",
        },
        config = function()
            -- [[ Configure nvim-cmp ]]
            -- See `:help cmp`
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'
            local lspkind = require 'lspkind'

            require('luasnip.loaders.from_vscode').lazy_load()
            luasnip.config.setup {}

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = {
                    autocomplete = false,
                    completeopt = 'menu,menuone,noinsert',
                },
                experimental = {
                    ghost_text = true
                },
                formatting = {
                    expandable_indicator = true,
                    fields = { 'menu', 'abbr', 'kind' },
                    format = lspkind.cmp_format({
                        with_text = true,
                        menu = {
                            buffer = "[buf]",
                            luasnip = "[snip]",
                            nvim_lsp = "[lsp]",
                            nvim_lua = "[vim]",
                            path = "[path]"
                        }
                    })
                },
                mapping = cmp.mapping.preset.insert {
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete {},
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if require("copilot.suggestion").is_visible() then
                            require("copilot.suggestion").accept()
                        elseif cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'path' },
                },
            }

            cmp.setup.cmdline("/", {
                sources = {
                    { name = "buffer" },
                },
            })

            cmp.setup.cmdline(":", {
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })

            cmp.event:on("menu_opened", function()
                vim.b.copilot_suggestion_hidden = true
            end)

            cmp.event:on("menu_closed", function()
                vim.b.copilot_suggestion_hidden = false
            end)
        end
    },
    {
        "zbirenbaum/copilot.lua",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            local u = require("config.utils")
            local cp = require "copilot"
            cp.setup({
                panel = {
                    auto_refresh = false,
                    keymap = {
                        accept = "<CR>",
                        jump_prev = "[[",
                        jump_next = "]]",
                        refresh = "gr",
                        open = "<M-CR>",
                    },
                },
                suggestion = {
                    auto_trigger = false,
                    keymap = {
                        accept = false,
                        accept_word = "<M-Right>",
                        accept_line = "<M-Down>",
                        prev = "<M-[>",
                        next = "<M-]>",
                        dismiss = "<C-]>",
                    },
                },
            })


            vim.keymap.set(
                "i",
                "<M-l>",
                function()
                    if cp.suggestion.is_visible() then
                        cp.suggestion.accept()
                    else
                        cp.suggestion.next()
                    end
                end,
                { "[copilot] accept or next suggestion" }
            )
        end
    }
}
