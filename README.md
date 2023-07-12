##### Personal nvim configuration inspired by [Kickstart, LazyVim] plugins and settings.

#### *** Disclaimer *** 
##### - For advanced users i do not recomended this configuration unless you like the "simple" file structure i got going on.
##### - The configurations and the keymaps are strongly opinionated.
##### - Actively updated and further customizated.

### Requeriments: 
#### I'm currently using Debian 12 stable
#### Neovim = 0.9.1
```bash
sudo apt install snapd
sudo snap install core
sudo snap install nvim --channel=latest/stable --classic
sudo apt install python3-neovim
```
#### LSPs
```bash
sudo su
curl -fsSL https://deb.nodesource.com/setup_20.x
sudo apt install -y nodejs
corepack enable
pnpm setup
pnpm install -g typescript typescript-language-server
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
#### C compiler
```bash
sudo apt install gcc
```
#### libstdc++
```bash
sudo apt install libstdc++-12-dev
```
#### [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)
#### Install a font and configure it to the gnome terminal (or other terminal)
