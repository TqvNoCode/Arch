return {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
        require("lsp_signature").setup({
            bind = true,
            handler_opts = { border = "rounded" },
            hint_enable = false,
            floating_window = true,
            auto_close_after = nil,
        })
    end,
}
