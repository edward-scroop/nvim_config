return {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    lazy = false,
    config = function()
        -- local palette = require("nightfox.palette").load("carbonfox")

        require('nightfox').setup({
            options = {
                styles = {
                    comments = "italic",
                    conditionals = "NONE",
                    constants = "bold",
                    functions = "NONE",
                    keywords = "bold",
                    numbers = "italic",
                    operators = "NONE",
                    preprocs = "italic",
                    strings = "italic",
                    types = "italic",
                    variables = "NONE",
                },
            },
            palettes = {
                carbonfox = {
                    comment = "#af87df",
                    bg0 = "#1d1d2b",
                    bg1 = "black",
                    bg3 = "#121820",
                    fg1 = "white",
                    fg2 = "white",
                    sel0 = "#2a0b42",
                    sel1 = "#3d096e",
                },
            },
            -- specs = {
            --     carbonfox = {
            --         syntax = {
            --             type = palette.yellow.base,
            --             builtin1 = palette.yellow.dim,
            --             func = palette.blue.base,
            --             preproc = palette.magenta.base,
            --             field = palette.cyan.base,
            --             keyword = palette.magenta.bright,
            --             const = palette.orange.base,
            --             builtin0 = palette.red.dim,
            --             ident = palette.fg1,
            --             comment = palette.comment,
            --             string = palette.green.base,
            --             number = palette.orange.dim,
            --             operator = palette.fg2,
            --             bracket = palette.fg3,
            --         },
            --     },
            -- },
            groups = {
                carbonfox = {
                    ColorColumn = { bg = "#af0000" },
                    LineNrAbove = { fg = "#00ff00" },
                    LineNrBelow = { fg = "#ff0000" },
                    CursorLine = { bg = "#1c1c1c" },
                    CursorLineNr = { fg = "white", bg = "#1c1c1c" },
                },
            },
        })
        vim.cmd([[colorscheme carbonfox]])
    end,
}
