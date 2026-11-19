return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")
        ts.setup {}

        ts.install {
            "lua",
            "html",
            "css",
            "javascript",
            "typescript",
            "python",
            "rust",
            "diff",
            "gitcommit",
            "git_rebase",
            "vim",
            "vimdoc",
            "query",
            "json",
            "yaml",
            "toml",
            "markdown",
            "markdown_inline"
        }

        local max_filesize = 10 * 1024 * 1024 -- 10 MB

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match)
                if not lang then return end

                local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
                if ok and stats and stats.size > max_filesize then return end

                -- skips silently if no parser is installed for this filetype
                if pcall(vim.treesitter.start, args.buf, lang) then
                    -- optional: treesitter-based indent (experimental)
                    -- vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    -- optional: treesitter folds
                    -- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
                    -- vim.wo[0][0].foldmethod = "expr"
                end
            end,
        })
    end,
}
