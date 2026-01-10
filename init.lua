vim.opt.compatible = false
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.tabstop = 6
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest,full"
vim.opt.nrformats = "bin,hex,unsigned"
vim.opt.cc = "120"
vim.cmd([[ syntax on ]])
vim.opt.cursorline = true
vim.opt.ttyfast = true
vim.opt.background = "dark"
vim.opt.encoding = "utf-8"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "auto:4"
vim.opt.numberwidth = 3
vim.opt.statuscolumn = "%s %{v:lnum} %{v:relnum}"
vim.opt.mouse = ""
vim.opt.statusline = "%-F %y %m%r buff:%n        %l/%L,%o-%v --%p%%--"
vim.opt.termguicolors = true
vim.opt.hlsearch = false
vim.opt.clipboard = "unnamedplus"
vim.opt.updatetime = 500

vim.keymap.set('n', '<s-tab>', '<insert>')
vim.keymap.set('n', '<s-c-tab>', 'I')
vim.keymap.set({ 'n', 'i', 'v' }, '<c-C>', '<Esc>')
vim.keymap.set('v', 'p', '"_dP')

-- Jumps to last position on open
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})

vim.diagnostic.config({
    virtual_text = {
        prefix = '#', -- Prefix symbol
        suffix = '',  -- it's ok to set ''
        format = function(diagnostic)
            -- print(vim.inspect(diagnostic)) -- <-- You can print this to see what information is recorded
            return string.format([[
code: %s
source: %s
message: %s
]], -- Even if multiple lines are set, they'll actually be displayed on the same line, and if it's too long, it won't be fully visible. Of course, you can reduce the text size to try to see the full context (for example, if you use Neovide, you can lower vim.g.neovide_scale_factor, and so on)
                diagnostic.code,
                diagnostic.source,
                diagnostic.message
            )
        end,
    }
})

require("config.lazy")
