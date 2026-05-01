return {
    {
        "sainnhe/everforest",
        name = "everforest",
        priority = 999,
        config = function()
            vim.g.everforest_background = "medium"
            vim.g.everforest_better_performance = 1

           -- Set default theme
            local themes = {
                "everforest",
                "catppuccin",
                -- you can add more theme here!
            }
            local current_theme_index = 1
            -- Set default theme (first thene)
            vim.cmd.colorscheme(themes[current_theme_index])

            -- Key mapping to switch theme
            vim.keymap.set("n", "<leader>nt", function()
                current_theme_index = current_theme_index + 1
                if current_theme_index > #themes then
                    current_theme_index = 1
                end

                local theme = themes[current_theme_index]

                vim.cmd.colorscheme(theme)
                print("Changed nvim theme to: " .. theme)
            end, { noremap = true, silent = true })
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 800,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                transparent_background = false,
                term_colors = true,
                integrations = {
                    cmp = true, 
                    treesitter = true,
                    mason = true, 
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                        },
                    },
                },
            })
        end,
    },
}
