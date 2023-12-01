return {
	'willothy/wezterm.nvim',
	config = true,
	dir = '~/.config/wezterm/wezterm.lua',
	config = function()
		vim.keymap.set("n", "<leader>wt", 'wezterm')
	end,
};
