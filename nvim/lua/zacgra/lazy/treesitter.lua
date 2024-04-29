return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    "arduino",
                    "bash",
                    "c_sharp",
                    "c",
                    "css",
                    "csv",
                    "diff",
                    "dockerfile",
                    "lua",
                    "javascript",
                    "json",
                    "html",
                    "markdown",
                    "python",
                    "query",
                    "ruby",
                    "ssh_config",
                    "sql",
                    "terraform",
                    "tmux",
                    "typescript",
                    "vim",
                    "vimdoc",
                    "xml",
                    "yaml"
            },
            sync_install = false,
            auto_install = true, -- auto install when entering buffer
            highlight = { enable = true },
            indent = { enable = true },
            additional_vim_regex_highlighting = false
        })
    end
}

