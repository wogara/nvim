return {
	"ellisonleao/gruvbox.nvim",
	name = "gruvbox",
	priority = 1000,
	config = function()
    require("gruvbox").setup({
      transparent_mode = false
--      transparent_background=true
    })
		vim.cmd("colorscheme gruvbox")
	end,
}
