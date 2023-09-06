##### Personal nvim configuration inspired by [Kickstart, LazyVim] plugins and settings.
##### - The configurations and the keymaps are strongly opinionated.

### Requeriments: 
#### Bash commands tested using Debian 12 stable
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
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
sudo apt install -y nodejs
corepack enable
pnpm setup
pnpm install -g typescript typescript-language-server
```
#### [Live grep](https://github.com/BurntSushi/ripgrep)
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
#### Install a font and configure it to the terminal
#### Sync clipboard OS and Nvim, xclip if using X11 or wl-copy and wl-paste if using Wayland
```bash
sudo apt install wl-clipboard
```
or
```bash
sudot apt install xclip
```
