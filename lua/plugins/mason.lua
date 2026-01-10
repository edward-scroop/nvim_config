return {
    "mason-org/mason.nvim",
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
    dependencies = {
        "neovim/nvim-lspconfig",
    },
}
