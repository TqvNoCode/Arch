return {
    "karb94/neoscroll.nvim",
    opts = {},
    config = function()
        local neoscroll = require("neoscroll")

        require("neoscroll").setup({
            hide_cursor = false,
            stop_eof = true,
            respect_scrolloff = false,
            cursor_scrolls_alone = true,
            duration_multiplier = 0.8,
            easing = "linear",
            pre_hook = nil,
            post_hook = nil,
            performance_mode = false,
            ignored_events = {
                "WinScrolled",
                "CursorMoved",
            },
        })
        local keymap = {
            -- Scroll up and down half page
            ["<C-e>"] = function()
                neoscroll.ctrl_u({ duration = 250 })
            end,
            ["<C-y>"] = function()
                neoscroll.ctrl_d({ duration = 250 })
            end,

            -- Scroll up and down full page
            ["<C-b>"] = function()
                neoscroll.ctrl_b({ duration = 400 })
            end,
            ["<C-f>"] = function()
                neoscroll.ctrl_f({ duration = 400 })
            end,

            -- Usually Use
            ["<C-u>"] = function()
                neoscroll.scroll(-3, { move_cursor = false, duration = 100 })
            end,
            ["<C-d>"] = function()
                neoscroll.scroll(3, { move_cursor = false, duration = 100 })
            end,

            ["zt"] = function()
                neoscroll.zt({ half_win_duration = 300 })
            end,
            ["zz"] = function()
                neoscroll.zz({ half_win_duration = 300 })
            end,
            ["zb"] = function()
                neoscroll.zb({ half_win_duration = 300 })
            end,
        }
        local modes = { "n", "v", "x" }
        for key, func in pairs(keymap) do
            vim.keymap.set(modes, key, func)
        end
    end,
}
