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
### [Live grep](https://github.com/BurntSushi/ripgrep)
Standalone binary with no dependencies so we install with dpkg instead of gdebi or other tool.
```bash
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb
```
#### [File search](https://github.com/sharkdp/fd)
```bash
sudo apt install fd-find
```
### C compiler for treesitter (fzf)
```bash
sudo apt install gcc
```
### libstdc++
```bash
sudo apt install libstdc++-12-dev
```
