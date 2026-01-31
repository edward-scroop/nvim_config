return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local keymap = vim.keymap

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" } }
                }
            }
        })

        vim.lsp.config('systemd_lsp', {
            cmd = { 'systemd-lsp' },
            filetypes = { 'systemd' },
        })

        vim.lsp.enable("rust_analyzer")
        vim.lsp.enable("ansiblels")
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("yamlls")
        vim.lsp.enable("pylsp")
        vim.lsp.enable("systemd_lsp")

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf, silent = true }

                -- set keybinds
                opts.desc = "Show LSP references"
                keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)             -- show definition, references
                opts.desc = "Go to declaration"
                keymap.set("n", "gD", vim.lsp.buf.declaration, opts)                         -- go to declaration
                opts.desc = "Show LSP definitions"
                keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)            -- show lsp definitions
                opts.desc = "Show LSP implementations"
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)        -- show lsp implementations
                opts.desc = "Show LSP type definitions"
                keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)       -- show lsp type definitions
                opts.desc = "See available code actions"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)        -- see available code actions, in visual mode will apply to selection
                opts.desc = "Smart rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)                      -- smart rename
                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)                -- show diagnostics for line
                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts)                                -- show documentation for what is under cursor
                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)                       -- mapping to restart lsp if necessary
                opts.desc = "Format current buffer"
                keymap.set("n", "<leader>b", vim.lsp.buf.format, opts)                       -- format current buffer
                opts.desc = "Wrap word with double quotes"
                keymap.set("n", '<leader>w"', 'ciw""<Esc>P', opts)                       -- Wrap word with double quotes
                opts.desc = "Wrap word with single quotes"
                keymap.set("n", "<leader>w'", "ciw''<Esc>P", opts)                       -- Wrap word with single quotes

                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = ev.buf,
                    callback = function()
                        vim.lsp.buf.format { async = false, id = ev.data.client_id }
                    end,
                })
            end,
        })
    end,
}
