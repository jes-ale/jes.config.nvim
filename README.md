##### Personal nvim configuration havely inspired by Kickstart and LazyVim, not only on the plugins selection but the mental model of "plug and play" configurations for certain plugins.

#### *** Disclaimer *** 
##### - For advanced users i do not recomended this configuration unless you like the "simple" file structure i got going on.
##### - The configurations and specialy the keymaps are strongly opininated.
##### - Actively updated and further customizated.

### Requeriments: 
#### I'm currently using Debian 12 stable
#### Neovim = 0.9.0 
```bash
sudo apt install snapd
sudo apt install -beta neovim --classic
sudo snap install core
sudo snap install node --classic
sudo snap install nvim --channel=latest/stable --classic
sudo apt install python3-neovim
```
#### [Live grep](https://github.com/BurntSushi/ripgrep)
#### Standalone binary with no dependencies so we install with dpkg instead of gdebi or other tool.
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
