-- all vim helper function

vim.diagnostic.config({
  float = {
    -- Sử dụng "single" để tránh lỗi lòi nền mà Vinh vừa gặp
    border = "rounded",
    source = "always",  -- Hiện nguồn lỗi để Vinh dễ tra cứu khi làm đồ án DUT
    header = { " 󰋼 Diagnostics ", "DiagnosticFloating" },
    prefix = function(_, i) return string.format("%d. ", i) end,
    focusable = false,
  },
})

vim.keymap.set("n", "<leader>ce", function()
    local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
    if #diagnostics > 0 then
        local message = diagnostics[1].message
        vim.fn.setreg("+", message)
        print("Copied diagnostic: " .. message)
    else
        print("No diagnostic at cursor")
    end
end, { noremap = true, silent = true, desc = "Copy diagnostic at cursor" })

-- go to errors in a file :/
vim.keymap.set("n", "<leader>ne", vim.diagnostic.goto_next, { desc = "Next error"}) -- next err
vim.keymap.set("n", "<leader>pe", vim.diagnostic.goto_prev, { desc = "Previos error"}) -- previous err
vim.keymap.set("n", "<leader>se", vim.diagnostic.open_float, { desc = "Details of error (floating)" })


-- copy current file path (absolute) into clipboard
vim.keymap.set("n", "<leader>cp", function()
    local filepath = vim.fn.expand("%:p")
    vim.fn.setreg("+", filepath)                     -- Copy to Neovim clipboard
    vim.fn.system("echo '" .. filepath .. "' | wl-copy") -- Copy to Arch Kde clipboard
    print("Copied: " .. filepath)
end, { desc = "Copy absolute path to clipboard" })


-- open the current file in browser
vim.keymap.set("n", "<leader>ob", function()
    local file_path = vim.fn.expand("%:p")
    if file_path ~= "" then
        -- xdg-open will auto open Firefox/Chrome depend on KDE setting 
        os.execute("xdg-open " .. file_path .. " &") 
    else
        print("No file to open")
    end
end, { desc = "Open current file in browser" })


-- set language based on Vim mode
local function get_fcitx_layout()
    local f = io.popen("fcitx5-remote -n")
    if f ~= nil then
        local result = f:read("*all")
        f:close()
        return result and result:gsub("%s+", "") or "keyboard-us"
    end
    return "keyboard-us"
end

local function set_fcitx_layout(layout)
    os.execute("fcitx5-remote -s " .. layout)
end

local last_layout = "keyboard-us"

-- When exit Insert Mode: Autosave the stauts of current layout
vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        last_layout = get_fcitx_layout()
        set_fcitx_layout("keyboard-us")
    end,
})

-- When enter Insert Mode
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        set_fcitx_layout(last_layout)
    end,
})


-- Show folder/dir structure
vim.api.nvim_create_user_command("ShowTree", function()
    local buf = vim.api.nvim_create_buf(false, true)
    local editor_width = vim.o.columns
    local editor_height = vim.o.lines
    local width = math.floor(editor_width * 0.6)
    local height = math.floor(editor_height * 0.9)

    local row = math.floor((editor_height - height) / 2)
    local col = math.floor((editor_width - width) / 2)
    local opts = {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        border = "rounded",
        style = "minimal",
    }

    local win = vim.api.nvim_open_win(buf, true, opts)
    local job_id = vim.fn.jobstart("tree -L 4", {
        stdout_buffered = true,
        on_stdout = function(_, data)
            if data then
                for _, line in ipairs(data) do
                    vim.api.nvim_buf_set_lines(buf, -1, -1, true, { line })
                end
            end
        end,
        on_exit = function()
            -- vim.api.nvim_win_close(win, true)
        end,
    })
    print("Job ID: " .. job_id)
end, {})

vim.keymap.set("n", "<leader>vt", ":ShowTree<CR>", { desc = "Show directory tree in floating window" })
