# Core Terminology: Neovim & tmux

## Neovim Hierarchy

```
Tab
 └─ Window (split/pane view)
     └─ Buffer (file in memory)
```

### Buffer
- **What**: File loaded into memory
- **Analogy**: Open document (even if not visible)
- **Commands**:
  - `:ls` or `:buffers` - list all buffers
  - `:b <number>` - switch to buffer
  - `:bd` - delete/close buffer
- **Keymap**: `<leader><leader>` - fuzzy find buffers (Telescope)

### Window
- **What**: Viewport displaying a buffer (split/pane)
- **Analogy**: Panel showing a document
- **Commands**:
  - `:split` or `:sp` - horizontal split
  - `:vsplit` or `:vsp` - vertical split
  - `<C-w>c` - close window
  - `<C-w>o` - close all other windows
- **Keymaps**:
  - `<C-h/j/k/l>` - move focus between windows
  - `<C-w>=` - equalize window sizes

### Tab (Tab Page)
- **What**: Collection of windows (rarely used in modern workflows)
- **Analogy**: Desktop workspace
- **Commands**:
  - `:tabnew` - new tab
  - `:tabn` / `:tabp` - next/previous tab
  - `gt` / `gT` - next/previous tab
  - `:tabclose` - close tab

**Key insight**: Most people use **buffers** + **windows**, not tabs.

---

## tmux Hierarchy

```
Server
 └─ Session (project/context)
     └─ Window (full screen view)
         └─ Pane (split within window)
```

### Session
- **What**: Independent workspace (entire project context)
- **Analogy**: Virtual desktop for a project
- **Commands**:
  - `tmux new -s name` - create session
  - `tmux attach -t name` - attach to session
  - `tmux ls` - list sessions
  - `<prefix>d` - detach from session
- **Custom**: `tmx` script - fuzzy find/create sessions

### Window
- **What**: Full terminal screen (like browser tabs)
- **Analogy**: Tab in a terminal app
- **Commands**:
  - `<prefix>c` - create window
  - `<prefix>n/p` - next/previous window
  - `<prefix>,` - rename window
  - `<prefix>&` - kill window
- **Note**: Indexed starting at 1 (not 0) in this config

### Pane
- **What**: Split section within a window
- **Analogy**: Vim window/split
- **Keymaps** (custom in your config):
  - `<prefix>|` - split horizontal (left/right)
  - `<prefix>-` - split vertical (top/bottom)
  - `<prefix>h/j/k/l` - navigate panes (vim-style)
  - `<prefix>H/J/K/L` - resize panes
  - `<prefix>x` - kill pane

**Prefix**: `Ctrl-a` (custom, default is `Ctrl-b`)

---

## How They Work Together

```
tmux session: "dotfiles-project"
  └─ tmux window 1: "editor"
      ├─ tmux pane 1: [neovim running]
      │   ├─ nvim window 1 (left): showing buffer "config.lua"
      │   └─ nvim window 2 (right): showing buffer "README.md"
      └─ tmux pane 2: [shell]
  └─ tmux window 2: "tests"
      └─ tmux pane 1: [running tests]
```

## Typical Workflow

1. **tmux session** per project (`tmx` to switch)
2. **tmux windows** for different contexts (editor, tests, server, etc.)
3. **tmux panes** for side-by-side views (code + terminal)
4. **nvim windows** for split code views
5. **nvim buffers** for open files

## Quick Reference

| Concept | What | Where |
|---------|------|-------|
| **tmux session** | Project workspace | `tmx` script |
| **tmux window** | Terminal tab | `<prefix>c`, `<prefix>n/p` |
| **tmux pane** | Terminal split | `<prefix>\|/-`, `<prefix>h/j/k/l` |
| **nvim buffer** | File in memory | `<leader><leader>` |
| **nvim window** | Split view | `:sp`, `:vsp`, `<C-h/j/k/l>` |
| **nvim tab** | Workspace (rare) | `:tabnew`, `gt` |

## Integration

**vim-tmux-navigator**: Seamlessly navigate between tmux panes and nvim windows using `<C-h/j/k/l>` - the plugin makes the boundary invisible.
