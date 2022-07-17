-- <F3> formats the current file / selection
vim.api.nvim_set_keymap("n", "<F3>", ":Neoformat<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<F3>", ":Neoformat!", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>f", ":Neoformat<cr>", { noremap = true, silent = true })

-- Autoformat on save
vim.cmd([[
augroup fmt
    autocmd!
    au BufWritePre *.c,*.py,*.h,*.hpp,*.cpp,*.hs,*.tex try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END
autocmd FileType tex let b:autoformat_autoindent=0
]])

-- Custom formatter definitions
vim.g.neoformat_zsh_shfmt = {
    exe = "shfmt",
    args = { "-i 4" },
    stdin = 1,
}
vim.g.neoformat_json_prettier = {
    exe = "prettier",
    args = {
        "--stdin",
        "--stdin-filepath",
        '"%:p"',
        "--parser",
        "json",
        "--tab-width 2",
        "--print-width 100",
    },
    stdin = 1,
}
vim.g.neoformat_rust_customrustfmt = {
    exe = "rustfmt",
    args = { "--edition 2021" },
    stdin = 1,
}

vim.g.neoformat_enabled_haskell = { "ormolu" }
vim.g.neoformat_enabled_python = { "black" }
vim.g.neoformat_enabled_zsh = { "shfmt" }
vim.g.neoformat_enabled_rust = { "customrustfmt" }
vim.g.neoformat_enabled_yaml = { "prettier" }
