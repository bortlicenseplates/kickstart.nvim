return {
    -- lsp configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
        -- automatically install LSPs to stdpath for neovim
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',

        -- useful status updates for LSP
        -- note: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

        -- additional lua configuration, makes nvim stuff amazing!
        'folke/neodev.nvim',
        'joeveiga/ng.nvim',
    },
}
