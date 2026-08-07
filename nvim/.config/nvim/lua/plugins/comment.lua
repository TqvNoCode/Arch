return {
    'numToStr/Comment.nvim',
    opts = {},
    event = "VeryLazy",
    config = function()
        require('Comment').setup()
    end
}
