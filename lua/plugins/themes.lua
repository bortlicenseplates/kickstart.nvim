return {
    dev = true,
    dir = "../themer.nvim",
    opts = {
        light = "nord",
        dark = "kanagawa",
    },
    dependencies = {
        "psliwka/termcolors.nvim",
        {
            "norcalli/nvim-colorizer.lua",
            config = function()
                vim.o.termguicolors = true
                require("colorizer").setup {
                    'css',
                    'javascript',
                    'typescript',
                    'lua',
                    html = {
                        mode = 'foreground',
                    },
                }
            end,
        },
        "shaunsingh/nord.nvim",
        {
            "rebelot/kanagawa.nvim",
            config = function()
                require('kanagawa').setup({
                    compile = true,   -- enable compiling the colorscheme
                    undercurl = true, -- enable undercurls
                    commentStyle = { italic = true },
                    functionStyle = {},
                    keywordStyle = { italic = true },
                    statementStyle = { bold = true },
                    typeStyle = {},
                    transparent = false,   -- do not set background color
                    dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
                    terminalColors = true, -- define vim.g.terminal_color_{0,17}
                    colors = {             -- add/modify theme and palette colors
                        palette = {},
                        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                    },
                    overrides = function(colors) -- add/modify highlights
                        return {}
                    end,
                    theme = "wave",    -- Load "wave" theme when 'background' option is not set
                    background = {     -- map the value of 'background' option to a theme
                        dark = "wave", -- try "dragon" !
                        light = "lotus"
                    },
                })
            end,
        },
    },
    config = function()
        vim.cmd("colorscheme habamax")
    end,
}
