return {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- Only load Plugins when coding to reduce ram usage 
    config = function()
        require("nvim-autopairs").setup({
            check_ts = true,
            ts_config = {
                lua = { "string" },
                javascript = { "template_string" },
            },
        })
    end,
}
