return {
    "mason-org/mason.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        },
        PATH = "append",
        max_concurrent_installers = 4,
    },
    config = function(_, opts)
        require("mason").setup(opts)

        require("mason-tool-installer").setup {
            ensure_installed = {
                "ansible-language-server",
                "ansible-lint",
                "json-lsp",
                "lua-language-server",
                "python-lsp-server",
                "systemd-lsp",
                "systemdlint",
                "tree-sitter-cli",
                "typescript-language-server",
                "vue-language-server",
                "yaml-language-server",
            },
        }
    end,
}
