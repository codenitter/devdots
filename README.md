# Neovim Devcontainer

Easily set up a development environment for [LazyVim](https://www.lazyvim.org/) using devcontainers.

## Dependencies

- [DevPod](https://devpod.sh/)

## Usage

Start the devcontainer:

```bash
devpod up . --provider docker --dotfiles https://github.com/codenitter/devdots.git --dotfiles-script setup --ide none
```

