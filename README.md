## Personal [Neovim 0.9.1] configuration inspired by [Kickstart, LazyVim] plugins and settings.
#### The configurations and keymaps are strongly opinionated.

#### Requirements:
##### Debian based distro. Tested on ubuntu 18 and Debian 12.

#### Install Essentials
```bash
sudo apt update || { echo "Failed to update repositories.";  }
sudo apt install curl -y || { echo "Failed to install curl.";  }
sudo apt install snapd -y || { echo "Failed to install snapd."; }
sudo snap install core -y || { echo "Failed to install snap core."; }
```

#### Install Neovim and Dependencies
```bash
sudo snap install nvim --channel=latest/stable --classic || { echo "Failed to install nvim via snap."; }
sudo apt install python3-neovim -y || { echo "Failed to install python3-neovim."; }
```

#### LSP Setup for Python
```bash
sudo apt install python3 -y || { echo "Failed to install Python 3."; exit 1; }
sudo apt install python3-pylsp -y || { echo "Failed to install python3-pylsp."; }
sudo apt install python3.11-venv -y || { echo "Failed to install python3.11-venv."; }
```

#### Install OmniSharp for C#
```bash
sudo mkdir /usr/local/bin/omnisharp
curl -LO https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.39.10/omnisharp-linux-arm64-net6.0.tar.gz || { echo "Failed to download OmniSharp.";  }
sudo tar -xzf omnisharp-linux-arm64-net6.0.tar.gz -C /usr/local/bin/omnisharp || { echo "Failed to extract OmniSharp."; }
sudo mkdir /usr/local/bin/dotnet
curl -LO https://download.visualstudio.microsoft.com/download/pr/1cac4d08-3025-4c00-972d-5c7ea446d1d7/a83bc5cbedf8b90495802ccfedaeb2e6/dotnet-sdk-6.0.417-linux-x64.tar.gz || { echo "Failed to download dotnet sdk.";  }
sudo tar -xzf dotnet-sdk-6.0.417-linux-x64.tar.gz -C /usr/local/bin/dotnet || { echo "Failed to extract OmniSharp."; }
rm omnisharp-linux-arm64-net6.0.tar.gz || { echo "Failed to remove temporary files."; }
rm dotnet-sdk-6.0.417-linux-x64.tar.gz || { echo "Failed to remove temporary files."; }
```

#### Configure NodeSource Repository for Node.js
```bash
sudo apt install -y ca-certificates curl gnupg || { echo "Failed to install required packages."; }
sudo mkdir -p /etc/apt/keyrings || { echo "Failed to create directory /etc/apt/keyrings."; }
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg || { echo "Failed to download and setup NodeSource GPG key."; }
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list || { echo "Failed to add NodeSource repository."; }
sudo apt-get update || { echo "Failed to update apt."; }
sudo apt-get install -y nodejs="$NODE_MAJOR".* || { echo "Failed to install Node.js."; }
```

#### Enable corepack (interactive step)
```bash
sudo su
corepack enable
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
sudo apt install fd-find -y || { echo "Failed to install fd-find.";  }
```

#### Install C compiler
```bash
sudo apt install gcc -y || { echo "Failed to install C compiler."; }
```

#### Install libstdc++
```bash
sudo apt install libstdc++-12-dev -y || { echo "Failed to install libstdc++-12-dev.";  }
```

#### Install Nerd Fonts
#### (Refer to the Nerd Fonts documentation for manual configuration steps)

#### Sync clipboard between OS and Neovim
#### Choose the appropriate clipboard tool based on the display server in use

#### For Wayland
```bash
sudo apt install wl-clipboard -y || { echo "Failed to install wl-clipboard."; }
```

#### For X11
```bash
sudo apt install xclip -y || { echo "Failed to install xclip.";  }
```

#### Clean up temporary files
```bash
rm ripgrep_13.0.0_amd64.deb || { echo "Failed to remove temporary files."; }
```

#### Installation completed successfully
