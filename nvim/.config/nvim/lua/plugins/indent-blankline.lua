return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" }, -- Only load when open file
    opts = {
        indent = {
            char = "▏",
            tab_char = "▏",
        },
        scope = {
            enabled = true,
            show_start = true,
            show_end = false,
            
            highlight = { "Function", "Label" }, 
        },
        exclude = {
            filetypes = {
                "help", "lazy", "mason", "notify", "toggleterm",
            },
        },
    },
}
