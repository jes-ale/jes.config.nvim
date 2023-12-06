## Personal [Neovim 0.9.1] configuration inspired by [Kickstart, LazyVim] plugins and settings.
#### The configurations and keymaps are strongly opinionated.

#### Requirements:
##### Debian based distro. Tested on ubuntu 18 and Debian 12.

#### Install Essentials
```bash
sudo apt update || { echo "Failed to update repositories."; exit 1; }
sudo apt install curl || { echo "Failed to install curl."; exit 1; }
sudo apt install snapd || { echo "Failed to install snapd."; exit 1; }
sudo snap install core || { echo "Failed to install snap core."; exit 1; }
```

#### Install Neovim and Dependencies
```bash
sudo snap install nvim --channel=latest/stable --classic || { echo "Failed to install nvim via snap."; exit 1; }
sudo apt install python3-neovim || { echo "Failed to install python3-neovim."; exit 1; }
```

#### LSP Setup for Python
```bash
sudo apt install python3 || { echo "Failed to install Python 3."; exit 1; }
sudo apt-get install python3-pylsp || { echo "Failed to install python3-pylsp."; exit 1; }
sudo apt install python3.11-venv || { echo "Failed to install python3.11-venv."; exit 1; }
```

#### Install OmniSharp for C#
```bash
curl -LO https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.39.10/omnisharp-linux-arm64-net6.0.tar.gz || { echo "Failed to download OmniSharp."; exit 1; }
tar -xzf omnisharp-linux-x64.tar.gz || { echo "Failed to extract OmniSharp."; exit 1; }
sudo mv omnisharp /usr/local/bin/ || { echo "Failed to move OmniSharp to /usr/local/bin/."; exit 1; }
rm omnisharp-linux-x64.tar.gz || { echo "Failed to remove temporary files."; exit 1; }
sudo apt-get install -y dotnet-sdk-6.0 || { echo "Failed to install .NET SDK."; exit 1; }
```

#### Configure NodeSource Repository for Node.js
```bash
sudo apt-get install -y ca-certificates curl gnupg || { echo "Failed to install required packages."; exit 1; }
sudo mkdir -p /etc/apt/keyrings || { echo "Failed to create directory /etc/apt/keyrings."; exit 1; }
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg || { echo "Failed to download and setup NodeSource GPG key."; exit 1; }
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list || { echo "Failed to add NodeSource repository."; exit 1; }
sudo apt-get install nodejs -y || { echo "Failed to install Node.js."; exit 1; }
```

#### Enable corepack (interactive step)
```bash
sudo su
corepack enable
exit
```

#### Setup pnpm
```bash
pnpm setup || { echo "Failed to setup pnpm."; exit 1; }
```

#### Install TypeScript and TypeScript Language Server
```bash
pnpm install -g typescript typescript-language-server || { echo "Failed to install TypeScript and TypeScript Language Server."; exit 1; }
```

#### Install Live grep (ripgrep)
```bash
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb || { echo "Failed to download ripgrep."; exit 1; }
sudo dpkg -i ripgrep_13.0.0_amd64.deb || { echo "Failed to install ripgrep."; exit 1; }
```

#### Install File search (fd)
```bash
sudo apt install fd-find || { echo "Failed to install fd-find."; exit 1; }
```

#### Install C compiler
```bash
sudo apt install gcc || { echo "Failed to install C compiler."; exit 1; }
```

#### Install libstdc++
```bash
sudo apt install libstdc++-12-dev || { echo "Failed to install libstdc++-12-dev."; exit 1; }
```

#### Install Nerd Fonts
#### (Refer to the Nerd Fonts documentation for manual configuration steps)

#### Sync clipboard between OS and Neovim
#### Choose the appropriate clipboard tool based on the display server in use

#### For Wayland
```bash
sudo apt install wl-clipboard || { echo "Failed to install wl-clipboard."; exit 1; }
```

#### For X11
```bash
sudo apt install xclip || { echo "Failed to install xclip."; exit 1; }
```

#### Clean up temporary files
```bash
rm ripgrep_13.0.0_amd64.deb || { echo "Failed to remove temporary files."; exit 1; }
```

#### Installation completed successfully
