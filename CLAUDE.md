# Dotfiles Project

Ansible-based dotfiles management for macOS and Ubuntu/WSL.

## Structure

```
roles/
  neovim/       # Neovim configuration
  zsh/          # Zsh shell configuration
  ...
```

Each role has:
- `tasks/main.yml` - Entry point, imports platform-specific tasks
- `tasks/mac.yml` - macOS-specific tasks
- `tasks/ubuntu.yml` - Ubuntu/WSL-specific tasks
- `files/` - Configuration files to be copied

## Neovim

### Config Structure
- `files/init.lua` - Entry point
- `files/lua/core/` - Core config (options, keymaps, autocommands)
- `files/lua/plugins/` - Plugin configurations (lazy.nvim)

### Key Plugins
- `claudecode.nvim` - Claude Code integration (uses CLI auth, no API key needed)
- `copilot.lua` - GitHub Copilot
- LSP via `nvim-lspconfig` (not lsp-zero)

### Running the Role
```bash
# Normal run (preserves plugin data, cache, state)
dotfiles --tags neovim

# Fresh install (wipes everything and reinstalls)
dotfiles --tags neovim -e nvim_fresh_install=true
```

## Zsh

- Uses oh-my-zsh with 1password plugin
- 1Password CLI (`op`) is available for secrets
- SSH agent uses 1Password: `~/.1password/agent.sock`
- Aliases defined in `files/.zsh_aliases`

## Conventions

- Commit messages: imperative mood, concise summary, details in body
- Co-author tag: `Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>`
- Ansible variables use snake_case
- When adding conditional behavior, use `variable | default(false) | bool` pattern
