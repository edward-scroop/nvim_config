return {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    lazy = false,
    config = function()
        require('nightfox').setup({
            options = {
                styles = {
                    comments = "italic",
                    conditionals = "NONE",
                    constants = "NONE",
                    functions = "NONE",
                    keywords = "NONE",
                    numbers = "NONE",
                    operators = "NONE",
                    strings = "NONE",
                    types = "NONE",
                    variables = "NONE",
                },
            },
            palettes = {
                carbonfox = {
                    comment = "#af87df",
                    bg0 = "#1d1d2b",
                    bg1 = "#000000",
                    bg3 = "#121820",
                    fg2 = "#ffffff",
                    sel0 = "#2a0b42",
                    sel1 = "#3d096e",
                },
            },
            groups = {
                carbonfox = {
                    ColorColumn = { bg = "#af0000" },
                    LineNrAbove = { fg = "#00ff00" },
                    LineNrBelow = { fg = "#ff0000" },
                    CursorLine = { bg = "#1c1c1c" },
                    CursorLineNr = { fg = "#ffffff", bg = "#1c1c1c" },
                },
            },
        })
        vim.cmd([[colorscheme carbonfox]])
    end,
}
