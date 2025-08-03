# My Neovim Configuration

This is a personalized, modern Neovim configuration for C++ and general development, built from the ground up. It features LSP integration, debugging, autocompletion, and a suite of UI enhancements.

## Installation

This configuration is designed for a Debian/Ubuntu-based system.

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/actellim/nvim-config.git ~/.config/nvim
    ```

2.  **Run the dependency installation script:**
    This script will install Neovim nightly from source, along with all necessary system dependencies.
    ```bash
    ~/.config/nvim/install.sh
    ```

3.  **Launch Neovim:**
    The first time you launch `nvim`, the `lazy.nvim` plugin manager will automatically install all the configured plugins.

---

## Keymaps Guide

**Note:** The `<leader>` key is mapped to `<space>`.

### 📅 General & Core Editing

| Keymap | Description |
| :--- | :--- |
| `Ctrl` + `o` | Jump back to the previous (older) cursor location. |
| `Ctrl` + `i` | Jump forward to the next (newer) cursor location. |

### 🔳 Window & Tab Management

| Keymap | Description |
| :--- | :--- |
| `:sp` | Create a horizontal split. |
| `:vs` | Create a vertical split. |
| `Ctrl`+`w` `h`/`j`/`k`/`l` | Move to the split in the specified direction. |
| `Ctrl`+`w` `w` | Cycle through all open splits. |
| `:tabnew` | Create a new tab. |
| `gt` | Go to the next tab. |
| `gT` | Go to the previous tab. |
| `:term` | Open a terminal in a horizontal split. |
| `:vert term`| Open a terminal in a vertical split. |
| `Ctrl`+`\` `Ctrl`+`n`| Escape from Terminal mode to Normal mode. |

### 🧠 LSP (Language Intelligence)

These keymaps are only active in buffers with an attached LSP server.

| Keymap | Description |
| :--- | :--- |
| `gd` | **G**o to **D**efinition of the symbol under the cursor. |
| `gi` | **G**o to **I**mplementation (for interfaces/virtual functions). |
| `gr` | **G**o to **R**eferences (shows all usages). |
| `gD` | **G**o to **D**eclaration of the symbol. |
| `K` | Show hover documentation for the symbol under the cursor. |
| `<space>rn` | **R**e**n**ame the symbol under the cursor across the project. |
| `<space>ca` | Show **C**ode **A**ctions for the current line/selection. |

### 🩺 Diagnostics (Errors & Warnings)

| Keymap | Description |
| :--- | :--- |
| `[d` | Go to the **p**revious **d**iagnostic (error/warning). |
| `]d` | Go to the **n**ext **d**iagnostic. |
| `<space>e` | Expand the diagnostic message for the current line in a float. |
| `<space>q` | Show all diagnostics for the current buffer in the **q**uickfix list. |

### 🐞 DAP (Debugging)

| Keymap | Description |
| :--- | :--- |
| `<F5>` | Start/Continue the debugging session. |
| `<F10>` | Step **O**ver the current line. |
| `<F11>` | Step **I**nto the function on the current line. |
| `<F12>` | Step **O**ut of the current function. |
| `<space>b` | Toggle **B**reakpoint on the current line. |
| `<space>B` | Set a conditional **B**reakpoint. |
| `<space>dr` | Open the Debug **R**EPL. |
| `<space>dl` | **R**un the **L**ast debug session again. |

### 🎨 UI & Telescope

| Command | Description |
| :--- | :--- |
| `:Telescope themes` | Open the theme previewer. |
| `Ctrl`+`j` / `Ctrl`+`k` | (In Telescope) Move selection down/up from the prompt. |

### 🛠️ Utilities

| Keymap | Description |
| :--- | :--- |
| `<space>dg` | **D**oxygen: **G**enerate documentation. |
| `<space>do` | **D**oxygen: **O**pen documentation in the browser. |
