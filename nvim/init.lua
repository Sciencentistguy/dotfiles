vim.g.mapleader = ","

-- Packer.nvim plugin file
require("user.plugins")

vim.g.rooter_patterns = {
    ".git",
    "Cargo.lock",
    "CMakeLists.txt",
    "*.cabal",
    "stack.yaml",
    "package.yaml",
}

vim.cmd([[
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
]])

-- Regular vim options (not plugins)
require("user.vim-opts")

-- Set up LSP
require("user.lsp")

-- Commenter plugin
require("user.comment")

-- Automatically close brackets
require("user.autopair")

-- Colour scheme
require("onedark").setup({
    transparent = true,
})

-- Fancy statusbar
require("user.statusbar")

-- Code formatter
require("user.neoformat")

-- Vimtex
require("user.vimtex")

-- Show git status in sidebar
require("gitsigns").setup()

-- Plugin initialisation
require("crates").setup()
require("colorizer").setup()
require("lsp_signature").setup({
    hint_prefix = "",
})
require("telescope").setup()
require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")

require("coq_3p")({
    { src = "nvimlua", short_name = "nLUA", config_only = false },
    { src = "vimtex", short_name = "vTeX" },
})

vim.g.coq_settings = {
    auto_start = "shut-up",
    keymap = {
        recommended = false,
        eval_snips = "<leader>j",
    },
}

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
vim.api.nvim_set_keymap(
    "i",
    "<esc>",
    [[pumvisible() ? "<c-e><esc>" : "<esc>"]],
    { expr = true, noremap = true }
)
vim.api.nvim_set_keymap(
    "i",
    "<c-c>",
    [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]],
    { expr = true, noremap = true }
)
vim.api.nvim_set_keymap(
    "i",
    "<tab>",
    [[pumvisible() ? "<c-n>" : "<tab>"]],
    { expr = true, noremap = true }
)
vim.api.nvim_set_keymap(
    "i",
    "<s-tab>",
    [[pumvisible() ? "<c-p>" : "<bs>"]],
    { expr = true, noremap = true }
)

require("nvim-treesitter.configs").setup({
    ensure_intsalled = "maintained",
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = false,
        extended_mode = true,
    },
})

vim.cmd("COQnow -s")

local aucmds = {
    FileType = {
        {
            pattern = "nix",
            callback = function()
                vim.opt["tabstop"] = 2
                vim.opt["shiftwidth"] = 2
            end,
        },
    },
}

for event, opt_tbls in pairs(aucmds) do
    for _, opt_tbl in pairs(opt_tbls) do
        vim.api.nvim_create_autocmd(event, opt_tbl)
    end
end
