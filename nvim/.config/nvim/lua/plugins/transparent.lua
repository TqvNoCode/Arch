return {
	"xiyaowong/transparent.nvim",
	config = function()
		require("transparent").setup({
			enable = true,
			extra_groups = {
				"Normal",
				"NormalNC",
                "NormalFloat",
                "FloatBorder",
				-- "TelescopeBorder",
				-- "NvimTreeNormal",
				"LualineNormal",
				"FzfLuaBorder",
				"FzfLuaNormal",
				"FzfLuaTitle",
				"FzfLuaPreviewBorder",
				"FzfLuaPreviewNormal",
				"FzfLuaPreviewTitle",
                "NeoTreeNormal",
                "NeoTreeNormalNC",
                "NeoTreeEndOfBuffer",
                "NeoTreeWinSeparator",
                "NeoTreeStatusLine",
                "NeoTreeStatusLineNC",
                "NeoTreeVertSplit",
			},
		})

        -- turn on/off transparent
        vim.keymap.set("n", "<leader>tt", ":TransparentToggle<CR>", {
            noremap = true,
            silent = true,
            desc = "Toggle Transparent"
        })

		require("transparent").clear_prefix("NeoTree")
		require("transparent").clear_prefix("lualine")
		-- depends on pc, these settings are needed
		vim.cmd("highlight Normal guibg=NONE")
		vim.cmd("highlight Lualine guibg=NONE")
		vim.cmd("highlight Lualine guifg=NONE")
		vim.cmd("highlight NormalNC guibg=NONE")
		vim.cmd("highlight CursorLine guibg=NONE")
	end,
}
