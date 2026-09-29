vim.api.nvim_create_autocmd("BufWinEnter", {
    callback = function()
        if vim.bo.filetype == "help" and vim.api.nvim_win_get_config(0).relative == "" then
            -- Ensure environment stable before processing
            vim.schedule(function()
                local buf = vim.api.nvim_get_current_buf()
                
                if vim.api.nvim_win_is_valid(0) then
                    vim.api.nvim_win_close(0, false)
                end

                -- Adjust panel size 
                local width = math.floor(vim.o.columns * 0.8)
                local height = math.floor(vim.o.lines * 0.9)
                local col = math.floor((vim.o.columns - width) / 2)
                local row = math.floor((vim.o.lines - height) / 2)

                -- Create new panel for nvim help
                local win = vim.api.nvim_open_win(buf, true, {
                    relative = "editor",
                    width = width,
                    height = height,
                    col = col,
                    row = row,
                    border = "rounded", -- Đồng bộ style bo góc
                    style = "minimal",
                    title = " 📖 Nvim Help ",
                    title_pos = "center",
                })

                vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf, silent = true })
            end)
        end
    end,
})

