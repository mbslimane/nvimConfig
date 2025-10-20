return {
  -- React specific snippets
  {
    "ivanjermakov/troublesum.nvim",
    opts = {},
  },

  -- Tailwind CSS support (if you use it with Next.js)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {},
      },
    },
  },
}
