-- Reconfigure navigation keys

local modes = { 'n', 'v', 'o' }

vim.keymap.set(modes, 'j', 'h')
vim.keymap.set(modes, 'k', 'j')
vim.keymap.set(modes, 'l', 'k')
vim.keymap.set(modes, ';', 'l')

-- Disable original hjkl to avoid accidental use
vim.keymap.set('n', 'h', '<nop>')
vim.keymap.set('n', 'J', '<nop>')
vim.keymap.set('n', 'K', '<nop>')
vim.keymap.set('n', 'L', '<nop>')

-- Reconfigure window navigation keys (<C-w>...)
local wmap = function(lhs, rhs)
  vim.keymap.set('n', lhs, rhs, { noremap = true, silent = true })
end

-- <C-w> + direction
wmap('<C-w>j', '<C-w>h') -- j = left
wmap('<C-w>k', '<C-w>j') -- k = down
wmap('<C-w>l', '<C-w>k') -- l = up
wmap('<C-w>;', '<C-w>l') -- ; = right

-- Also support <C-w><C-h/j/k/l> variants (some people use these)
wmap('<C-w><C-j>', '<C-w><C-h>')
wmap('<C-w><C-k>', '<C-w><C-j>')
wmap('<C-w><C-l>', '<C-w><C-k>')
wmap('<C-w><C-;>', '<C-w><C-l>')

-- Color scheme
vim.cmd("colorscheme slate")
vim.cmd("highlight MatchParen guifg=#d7d787 guibg=#333333")

-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = false

-- Wildcards
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest"

-- Block folding
vim.opt.foldmethod = "syntax"

-- Autoread
vim.opt.autoread = true

-- Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Disable automatic comment features
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ 'r', 'o' })
    end
})
vim.opt.formatoptions:remove({ 'c', 'r', 'o' })

-- Normal mode mappings
vim.keymap.set(
    "n",
    "E",
    "<C-E>"
)
vim.keymap.set(
    "n",
    "Y",
    "<C-Y>",
    { noremap = true }
)
vim.keymap.set( -- When splitting horizontally, move to the lower window
    "n",
    "<C-W>s",
    "<C-W>s<C-w>j",
    { noremap = true }
)
vim.keymap.set( -- When splitting vertically, move to the right window
    "n",
    "<C-W>v",
    "<C-W>v<C-w>l",
    { noremap = true }
)

-- Terminal mode mappings
vim.keymap.set(
    "t",
    "<Esc>",
    "<C-\\><C-n>",
    { noremap = true }
)

-- Custom commands
vim.api.nvim_create_user_command(
    "Search",
    function(opts)
        vim.fn.jobstart("firefox -P \"Ofsouzap\" \"https://www.google.com/search?q=" .. opts.fargs[1] .. "\" &")
    end,
    { nargs = 1 }
)
vim.api.nvim_create_user_command(
    "NewTabTerm",
    function()
        vim.cmd("tabnew")
        vim.cmd("term")
        vim.cmd("startinsert")
    end,
    { nargs = 0 }
)

-- Abbreviations
vim.cmd("cnoreabbr FF Search")
vim.cmd("cnoreabbr NTerm NewTabTerm")
vim.cmd("cnoreabbr Nterm NewTabTerm")

-- Plugins

-- -- Set up lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- -- Specify plugins

local plugins = {
    {
        -- lspconfig
        "neovim/nvim-lspconfig",
        branch = "master"
    },
    {
        -- mason
        "williamboman/mason.nvim"
    },
    {
        -- mason-lspconfig
        "williamboman/mason-lspconfig.nvim"
    },
    {
        -- lualine
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        -- Neo-tree
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    {
        -- telescope
        "nvim-telescope/telescope.nvim",
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        -- nvim-treesitter
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    {
        -- autopairs
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        -- VimTeX
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "zathura"
        end
    }
}

require("lazy").setup(plugins)

-- -- Set up mason

require("mason").setup()

-- -- Set up mason-lspconfig
-- -- (must be after mason)

require("mason-lspconfig").setup({
    automatic_installation = false
})

-- -- Set up lualine

require("lualine").setup({
    options = {
        theme = 'auto'
    }
})

-- -- Set up neo-tree

require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false
        }
    }
})

vim.keymap.set(
    "n",
    "<C-n><C-n>",
    ":Neotree action=focus source=filesystem position=float toggle reveal<CR>",
    { noremap = true }
)
vim.keymap.set(
    "n",
    "<C-n><C-b>",
    ":Neotree action=focus source=buffers position=float toggle reveal<CR>",
    { noremap = true }
)

-- -- Set up telescope

require("telescope").setup({})

local telescope_builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})

-- -- -- Telescope for LSP pickers
vim.keymap.set('n', '<leader>gd', telescope_builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>gi', telescope_builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>gr', telescope_builtin.lsp_references, {})
vim.keymap.set('n', '<leader>e', telescope_builtin.diagnostics, {})


-- LSP
-- (must be after mason and mason-lspconfig)

-- -- Specify servers

local lspconfig = require("lspconfig")
lspconfig.rust_analyzer.setup {
    settings = {
        ['rust_analyzer'] = {
            diagnostics = {
                enable = true
            }
        }
    }
}
lspconfig.pyright.setup {}
lspconfig.hls.setup {}
lspconfig.ts_ls.setup {}
lspconfig.lua_ls.setup {}
lspconfig.clangd.setup {}
lspconfig.ocamllsp.setup {}
lspconfig.gopls.setup {}

-- -- Global mappings (from https://github.com/neovim/nvim-lspconfig)
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- -- Mappings for after LSP server attaches to current buffer (from https://github.com/neovim/nvim-lspconfig)
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
