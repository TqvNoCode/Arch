return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        -- add language u want to highlight in code
        ensure_installed = {
            "c", "cpp", "arduino", "python", 
            "lua", "vim", "vimdoc",          -- neovim configuration 
            "bash", "json", "markdown"       -- System and takenote
        },
        
        auto_install = true, 
        
        highlight = { enable = true },
        indent = { enable = true },
    },
    config = function(_, opts)
        require("nvim-treesitter").setup(opts)
    end,
}
