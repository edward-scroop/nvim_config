return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
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
            },
            sync_install = false,
            auto_install = true,
            -- ignore_install = { "" },
            highlight = {
                enable = true,
                disable = function(lang, buf)
                    local max_filesize = 10 * 1024 * 1024 -- 10 MB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    local disabled_langs = { "" }

                    if vim.tbl_contains(disabled_langs, lang) then
                        return true
                    end

                    if ok and stats and stats.size > max_filesize then
                        return true
                    end

                    return false
                end,

                additional_vim_regex_highlighting = false,
            },
        }
    end,
}
