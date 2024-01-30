return {
    "APZelos/blamer.nvim",
    init = function()
        vim.g.blamer_enabled = true
        vim.g.blamer_delay = 250
        vim.g.blamer_show_in_inset_modes = true
        vim.g.blamer_prefix = " ◊=>> "
    end
}
