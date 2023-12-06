## Personal [Neovim 0.9.1] configuration inspired by [Kickstart, LazyVim] plugins and settings.
#### The configurations and keymaps are strongly opinionated.

#### Requirements:
##### Debian based distro. Tested on ubuntu 18 and Debian 12.

#### Install Essentials
```bash
sudo apt update || { echo "Failed to update repositories.";  }
sudo apt install curl || { echo "Failed to install curl.";  }
sudo apt install snapd || { echo "Failed to install snapd."; }
sudo snap install core || { echo "Failed to install snap core."; }
```

#### Install Neovim and Dependencies
```bash
sudo snap install nvim --channel=latest/stable --classic || { echo "Failed to install nvim via snap."; }
sudo apt install python3-neovim || { echo "Failed to install python3-neovim."; }
```

#### LSP Setup for Python
```bash
sudo apt install python3 || { echo "Failed to install Python 3."; exit 1; }
sudo apt-get install python3-pylsp || { echo "Failed to install python3-pylsp."; }
sudo apt install python3.11-venv || { echo "Failed to install python3.11-venv."; }
```

#### Install OmniSharp for C#
```bash
curl -LO https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.39.10/omnisharp-linux-arm64-net6.0.tar.gz || { echo "Failed to download OmniSharp.";  }
tar -xzf omnisharp-linux-arm64-net6.0.tar.gz || { echo "Failed to extract OmniSharp."; }
sudo mv omnisharp /usr/local/bin/ || { echo "Failed to move OmniSharp to /usr/local/bin/."; }
rm omnisharp-linux-x64.tar.gz || { echo "Failed to remove temporary files."; }
sudo apt-get install -y dotnet-sdk-6.0 || { echo "Failed to install .NET SDK."; }
```

#### Configure NodeSource Repository for Node.js
```bash
sudo apt-get install -y ca-certificates curl gnupg || { echo "Failed to install required packages."; }
sudo mkdir -p /etc/apt/keyrings || { echo "Failed to create directory /etc/apt/keyrings."; }
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg || { echo "Failed to download and setup NodeSource GPG key.";  }
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list || { echo "Failed to add NodeSource repository."; }
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
pnpm setup || { echo "Failed to setup pnpm."; }
```

#### Install TypeScript and TypeScript Language Server
```bash
pnpm install -g typescript typescript-language-server || { echo "Failed to install TypeScript and TypeScript Language Server.";  }
```

#### Install Live grep (ripgrep)
```bash
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb || { echo "Failed to download ripgrep.";  }
sudo dpkg -i ripgrep_13.0.0_amd64.deb || { echo "Failed to install ripgrep."; }
```

#### Install File search (fd)
```bash
sudo apt install fd-find || { echo "Failed to install fd-find.";  }
```

#### Install C compiler
```bash
sudo apt install gcc || { echo "Failed to install C compiler."; }
```

#### Install libstdc++
```bash
sudo apt install libstdc++-12-dev || { echo "Failed to install libstdc++-12-dev.";  }
```

#### Install Nerd Fonts
#### (Refer to the Nerd Fonts documentation for manual configuration steps)

#### Sync clipboard between OS and Neovim
#### Choose the appropriate clipboard tool based on the display server in use

#### For Wayland
```bash
sudo apt install wl-clipboard || { echo "Failed to install wl-clipboard."; }
```

#### For X11
```bash
sudo apt install xclip || { echo "Failed to install xclip.";  }
```

#### Clean up temporary files
```bash
rm ripgrep_13.0.0_amd64.deb || { echo "Failed to remove temporary files."; }
```

#### Installation completed successfully
