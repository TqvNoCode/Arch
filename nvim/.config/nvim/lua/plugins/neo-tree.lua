return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            window = {
                width = 30,
                mappings = {
                    ["<space>"] = "none",
                },
            },
            filesystem = {
                hijack_netrw_behavior = "disabled",
                use_libuv_file_watcher = true,
                filtered_items = {
                    visible = true, -- Show all hidden files
                },
                follow_current_file = { enabled = true, leave_dirs_open = false, },
            },
        })

        -- Phím tắt để mở/đóng nhanh Neo-tree
        vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = "Open Neotree" })
    end
}
