vim.api.nvim_create_autocmd("BufWinEnter", {
    callback = function()
        -- 1. Chỉ chạy nếu là file help và chưa phải là cửa sổ nổi
        if vim.bo.filetype == "help" and vim.api.nvim_win_get_config(0).relative == "" then
            -- Dùng schedule để đảm bảo môi trường cửa sổ đã ổn định trước khi xử lý
            vim.schedule(function()
                local buf = vim.api.nvim_get_current_buf()
                
                -- Đóng cửa sổ split vừa mở ra
                if vim.api.nvim_win_is_valid(0) then
                    vim.api.nvim_win_close(0, false)
                end

                -- 2. Tính toán lại kích thước (Tỉ lệ 80% màn hình 14-inch)
                local width = math.floor(vim.o.columns * 0.8)
                local height = math.floor(vim.o.lines * 0.8)
                local col = math.floor((vim.o.columns - width) / 2)
                local row = math.floor((vim.o.lines - height) / 2)

                -- 3. Tạo cửa sổ nổi mới
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

                -- Nhấn 'q' để đóng nhanh
                vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf, silent = true })
            end)
        end
    end,
})

