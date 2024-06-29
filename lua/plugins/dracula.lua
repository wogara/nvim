return {
	"Mofiqul/dracula.nvim",
	name = "dracula",
	priority = 1000,
	config = function()
		require("dracula").setup({})
		vim.cmd.colorscheme("dracula")
	end,
}
