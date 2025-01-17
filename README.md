## Neovim Configuration

- uses packer.nvim as plugin manager
- fairly simple to add extensions
    - add the extension in packer file /lua/sowmithk/packer.lua
    - do :PackerSync to get the plugin
    - create the config for that plugin in /after/plugin/<plugin-name.lua>

Base config came from theprimeagen/init.lua

- Uses Stow to manage symlinks, clone it, and run `stow <subdir>` to create the symlinks
