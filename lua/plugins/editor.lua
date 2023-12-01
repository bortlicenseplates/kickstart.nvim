return {

    -- detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',


    {
        -- set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- see `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'onedark',
                component_separators = '|',
                section_separators = '',
            },
        },
    },

    {
        -- add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- enable `lukas-reineke/indent-blankline.nvim`
        -- see `:help indent_blankline.txt`
        main = "ibl",
        opts = {},
    },

    -- "gc" to comment visual regions/lines
    { 'numtostr/comment.nvim', opts = {} }
}
