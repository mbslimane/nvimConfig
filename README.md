# Neovim Configuration Guide

## Overview
Complete setup of Neovim 0.11.4 with LazyVim as the configuration framework, optimized for TypeScript, React, and Next.js development.

## Installation Steps

### 1. Remove Existing Neovim
```bash
# Remove Neovim binary
sudo rm -f /usr/local/bin/nvim

# Remove from package managers
sudo apt remove neovim -y
sudo apt purge neovim -y

# Remove configuration directories
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```

### 2. Install Neovim 0.11.4

```bash
  cd /tmp
  wget https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.tar.gz
  tar xzf nvim-linux-x86_64.tar.gz
  sudo cp -r nvim-linux-x86_64/* /usr/local/

  # Create symlink
  sudo ln -sf /usr/local/bin/nvim /usr/bin/nvim
```

### 3. Install LazyVim
```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true

# Install LazyVim starter
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

### 4. Configure TypeScript LSP

Create or modify ~/.config/nvim/lua/plugins/lsp.lua:

```lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          settings = {
            typescript = {
              strict = true,
              noImplicitAny = true,
              noImplicitReturns = true,
              noUnusedLocals = true,
              noUnusedParameters = true,
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
              },
            },
            javascript = {
              strict = true,
              noImplicitAny = true,
              noImplicitReturns = true,
              noUnusedLocals = true,
              noUnusedParameters = true,
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
              },
            },
          },
        },
      },
    },
  },
}
```


### 5. Add TypeScript Keymaps
Create or modify ~/.config/nvim/lua/config/keymaps.lua:

```lua 
vim.keymap.set("n", "<leader>ci", "<cmd>TypescriptAddMissingImports<CR>", { desc = "Add missing imports" })
vim.keymap.set("n", "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", { desc = "Organize imports" })
vim.keymap.set("n", "<leader>cu", "<cmd>TypescriptRemoveUnused<CR>", { desc = "Remove unused" })
```


### 6. Install Additional Plugins (Optional)

Create ~/.config/nvim/lua/plugins/extra.lua:

```lua
return {
  -- Better TypeScript experience
  {
    "dmmulroy/tsc.nvim",
    config = true,
    cmd = { "TSC" }
  },
  
  -- TypeScript-specific tools
  {
    "marilari88/twoslash-queries.nvim",
    opts = {},
  },
}
```

## Complete File Structure

~/.config/nvim/
├── init.lua                    # Main entry point
├── lazy-lock.json              # Plugin versions lock file
└── lua/
    ├── config/
    │   ├── autocmds.lua        # Auto-commands
    │   ├── keymaps.lua         # Custom keymaps (with TypeScript keymaps)
    │   ├── lazy.lua            # Lazy.nvim configuration
    │   └── options.lua         # Neovim options
    └── plugins/
        ├── lsp.lua             # LSP configuration (TypeScript setup)
        ├── linting.lua         # ESLint and diagnostics
        ├── extra.lua           # Additional plugins
        ├── ...
        └── **/*.lua            # Other plugin configurations

## Key Commands

### Neovim Management 
```bash
# Check version
nvim --version

# Clean reinstall
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.cache/nvim
```


### LazyVim Commands

```vim
:Lazy          # Plugin management
:LspInstall    # Install language servers
:Mason         # Install LSPs/tools
:LspInfo       # Check LSP status
:checkhealth   # System health check
```

### Development shortCuts

```vim 
<leader>cd     # Go to definition
<leader>cr     # Rename symbol
<leader>ci     # Add missing imports (TypeScript)
<leader>co     # Organize imports (TypeScript)
<leader>cu     # Remove unused (TypeScript)
<leader>ca     # Code actions
gd            # Go to definition
K             # Hover documentation
```


## Migration

### Copy to Another User

```bash 
sudo cp -r /home/mz/.config/nvim /home/ramboe/.config/
sudo chown -R ramboe:ramboe /home/ramboe/.config/nvim
```
```
