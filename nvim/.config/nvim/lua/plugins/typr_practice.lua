return {
	{
		"nvzone/typr",
		dependencies = "nvzone/volt",
		opts = {
			winlayout = "responsive",
			mode = "words", -- "words" or "phrases"
			wpm_goal = 130,
			numbers = false,
			symbols = false,
			random = false,
			kblayout = "qwerty",
			on_attach = function(buf)
				-- turn off autopairs
				vim.b[buf].autopairs_disable = true

				-- turn off cmp completion
				vim.b[buf].completion_disable = true
			end,
		},
		cmd = { "Typr", "TyprStats" },
	},
}
