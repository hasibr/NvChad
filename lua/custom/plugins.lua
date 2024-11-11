local plugins = {
  -- null-ls, language server that lets us run cli tools that have no language
  -- server
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python", "go"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  -- Plugin providing binding for a number of different formatters
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.formatter"
    end
  },
  -- Plugin providing binding for a number of different linters
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end
  },
  -- Mason, plugin manager for neovim. Configure Mason to install these.
  {
    "williamboman/mason.nvim",
    opts = {
      -- Install using :MasonInstallAll command in neovim
      ensure_installed = {
        -- Python formatter
        "black",
        -- Python static type checker (uses parser built in to Python interpreter)
        "mypy",
        -- Python linter
        "ruff",
        -- Python static type checker (uses its own parser)
        "pyright",
        -- JS / TS language server
        "typescript-language-server",
        -- JS / TS linter (supports linting using system or project's eslint config)
        "eslint-lsp",
        -- JS / TS formatter
        "prettier",
        -- Go language server
        "gopls",
      },
    },
  },
  -- Custom configuration for neovim/nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function ()
      -- Default nvchad lsp config
      require "plugins.configs.lspconfig"
      -- Custom lsp config
      require "custom.configs.lspconfig"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  }
}
return plugins
