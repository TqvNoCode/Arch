return {
	{
		"sainnhe/everforest",
		name = "everforest",
		priority = 999,
		config = function()
			vim.g.everorest_background = "medium"
			vim.g.everforest_better_performance = 1

			vim.cmd.colorscheme("everforest")
		end,
	},
}
