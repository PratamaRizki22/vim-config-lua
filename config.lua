-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


lvim.plugins = {
    {
        "wakatime/vim-wakatime",
    },
}


vim.opt.wrap = true
vim.opt.linebreak = true   -- Membuat kata tidak terpotong di tengah saat line wrapping
vim.opt.breakindent = true -- Menambahkan indentasi pada baris yang dibungkus


vim.api.nvim_create_autocmd({ "BufRead", "BufEnter" }, {
    pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif" }, -- Sesuaikan pola untuk file gambar
    callback = function()
        vim.cmd('silent !xdg-open ' .. vim.fn.shellescape(vim.fn.expand('%:p')) .. ' &')
        vim.cmd('bdelete!')
    end
})

-- Menggunakan 'gofmt' sebagai formatter untuk Go
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    {
        command = "gofmt",
        filetypes = { "go" },
    },
}

lvim.format_on_save = true


vim.opt.tabstop = 4      -- Jumlah spasi yang mewakili satu tab (umumnya 4 spasi)
vim.opt.shiftwidth = 4   -- Lebar indentasi untuk perintah shift (>>, <<)
vim.opt.softtabstop = 4  -- Jumlah spasi yang digunakan saat menekan Tab dalam mode insert
vim.opt.expandtab = true -- Gunakan spasi alih-alih tab (jika Anda ingin menggunakan tab karakter, atur ke `false`)

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("html", {
    s("!", {
        t({
            "<!DOCTYPE html>",
            "<html lang=\"en\">",
            "<head>",
            "    <meta charset=\"UTF-8\">",
            "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">",
            "    <title>Document</title>",
            "</head>",
            "<body>",
            "    ",
            "</body>",
            "</html>",
        }),
    }),
})

local cmp = require("cmp")
