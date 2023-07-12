Personal nvim configuration havely inspired by Kickstart and LazyVim, not only on the plugins selection but the mental model of "plug and play" configurations for certain plugins.

Actively updated and further customizated.
Not recomendes for anyone to install unless you like the "simple" file structure i got going on.
The configurations and specialy the keymaps are strongly opininated.

## Requeriments: 
### Neovim > 0.9.0 < 0.10.0 (until fzf current buffer telescope fixes the deprecated function cuz it's going to breake probably at some point in the near future)
```bash
sudo apt snapd
sudo apt install -beta neovim --classic
sudo snap install core
sudo snap install node --classic
sudo snap install nvim --channel=latest/stable --classic
sudo apt install python3-neovim
```
### [Live grep](https://github.com/BurntSushi/ripgrep)https://github.com/BurntSushi/ripgrep
#### [File search](https://github.com/sharkdp/fd)https://github.com/sharkdp/fd
### C compiler for treesitter (fzf)
```bash
sudo apt install gcc
```
### libstdc++
```bash
sudo apt install libstdc++-12-dev
```
