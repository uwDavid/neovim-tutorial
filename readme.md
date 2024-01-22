# Neovim Configuration Tutorial
## Start Configuration
To start configuration, Neovim loads all files in its runtime path here: <br>
`~/.config/nvim`
<br>By default, `init.lua` in any folder will be run as its main function.
<br>So we add a `init.lua` file inside our config directory: 
<br>`touch ~/.config/nvim/init.lua`

**Note**<br>
Be sure to use `:checkhealth` in nvim to see if you are missing any programs.

## 1 - Initial Setup 
The initial setup branch shows how we can configure Neovim in `init.lua` and install some essential plugins. 

When installing telescope, you need to also install `ripgrep`
```
$ sudo app install ripgrep
```

## 2 - Install Font 
To install JetBrains Mono Font: <br> 
Extract the `.zip` files in folder, then move the `.ttf` files to destination folder.
`~/.local/share/fonts` or `/usr/share/fonts` for system-wide install 

Then run:
```
$ fc-cache -f -v
```

## 3 - Refactoring Neovim Plugins
We can shorten our plug-in list in `~/.config/nvim/init.lua` to just a string: 
```
require("lazy").setup("plugins")
```

Then, in `~/.config/nvim/lua/plugins.lua` or `~/.config/nvim/lua/plugins/init.lua` <br>
We return our list of plugins like this: 
```
return {
    "folke/neodev.nvim",
    "folke/which-key.nvim"
}
```

Additionally, any `lua` file in `~/.config/nvim/lua/plugins/*.lua` are automatically merge in main plugin spec.
What this means is that any `*.lua` files in this `/plugins` directory will be automatically loaded in the `init.lua` call 
```
require("lazy").setup("plugins")
```

**Lazy config**
LazyVim `config` is executed when the plugin loads. 
The default implementation will automatically run `require(MAIN).setup(opts)`.
This will allow us to keep our `init.lua` file even cleaner by moving the plugin specific `.setup()` calls to their respective plugin file.

## 4 - LSP Setup 
Language Server Protocol (LSP) enables language intelligence features. 
To do this we will require 3 plugins: 
`Mason` - helps manage and install language servers
`Mason-lspconfig` - help bridge between lsp and lsp-config
`nvim-lspocnfig` - connects neovim to language servers

After this is done be sure to check your language server status by using `:LspInfo`

## 5 - None-LS
None-LS replaces Null-LS to enable linting and formatting. 
It works by wrapping cmd line tools in a lsp.

Check configurations in `lua/plugins/none-ls.lua`

Also ensure to use `:Mason` to install the required linters and formatters. 
Note: <br> 
Linters provide syntax analysis and formatting, while formatters only format the code. 
