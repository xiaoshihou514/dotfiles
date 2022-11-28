-- Example config
-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "lunar"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- Options and keybinds
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("i", "qi", "<ESC>", opts)
keymap("v", "qv", "<ESC>", opts)

local options = {
    backup = false, -- creates a backup file
    fileencoding = "utf-8", -- the encoding written to a file
    ignorecase = true, -- ignore case in search patterns
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    tabstop = 4, -- insert 2 spaces for a tab
    cursorline = true, -- highlight the current line
    number = true, -- set numbered lines
    relativenumber = true, -- set relative numbered lines
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    wrap = false, -- display lines as one long line
    title = true,
}
vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.fillchars:append {
    stl = " ",
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "lua",
    "rust",
    "toml",
}

lvim.plugins = {
    "simrat39/rust-tools.nvim",
    {
        "saecki/crates.nvim",
        tag = "v0.3.0",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("crates").setup {
                null_ls = {
                    enabled = true,
                    name = "crates.nvim",
                },
            }
        end,
    },
    {
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup()
        end,
    },
    "karb94/neoscroll.nvim",
}

-- neoscroll
reload "user.neoscroll"
require "user.rust-starter"
