# Personal nvim configuration inspired by [Kickstart, LazyVim] plugins and settings.
# The configurations and keymaps are strongly opinionated.

# Requirements:
# Debian based distro. Tested on ubuntu 18 and Debian 12.
# Neovim = 0.9.1

# Install Essential Tools with Error Handling
sudo apt install curl || { echo "Failed to install curl."; exit 1; }

# Install Neovim and Dependencies
sudo apt install snapd || { echo "Failed to install snapd."; exit 1; }
sudo snap install core || { echo "Failed to install snap core."; exit 1; }
sudo snap install nvim --channel=latest/stable --classic || { echo "Failed to install nvim via snap."; exit 1; }
sudo apt install python3-neovim || { echo "Failed to install python3-neovim."; exit 1; }

# LSP Setup for Python
# Ensure repositories are up to date
sudo apt-get update || { echo "Failed to update repositories."; exit 1; }

# Install Python 3.9
sudo apt-get install python3.9 || { echo "Failed to install Python 3.9."; exit 1; }

# Install Python 3 and pylsp
sudo apt install python3 || { echo "Failed to install Python 3."; exit 1; }
sudo apt-get install python3-pylsp || { echo "Failed to install python3-pylsp."; exit 1; }
sudo apt install python3.11-venv || { echo "Failed to install python3.11-venv."; exit 1; }

# Install OmniSharp for C#
# Download and install OmniSharp with Error Handling
curl -LO https://github.com/omnisharp/omnisharp-roslyn/releases/download/v1.37.1/omnisharp-linux-x64.tar.gz || { echo "Failed to download OmniSharp."; exit 1; }
tar -xzf omnisharp-linux-x64.tar.gz || { echo "Failed to extract OmniSharp."; exit 1; }
sudo mv omnisharp /usr/local/bin/ || { echo "Failed to move OmniSharp to /usr/local/bin/."; exit 1; }
rm omnisharp-linux-x64.tar.gz || { echo "Failed to remove temporary files."; exit 1; }

# Install .NET SDK for OmniSharp
# Refer to OmniSharp documentation for the latest version and installation instructions
sudo apt-get install -y dotnet-sdk-6.0 || { echo "Failed to install .NET SDK."; exit 1; }

# Configure NodeSource Repository for Node.js
# Ensure required packages are installed
sudo apt-get install -y ca-certificates curl gnupg || { echo "Failed to install required packages."; exit 1; }
sudo mkdir -p /etc/apt/keyrings || { echo "Failed to create directory /etc/apt/keyrings."; exit 1; }

# Download and setup NodeSource GPG key
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg || { echo "Failed to download and setup NodeSource GPG key."; exit 1; }

# Set Node.js major version
NODE_MAJOR=20

# Add NodeSource repository
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list || { echo "Failed to add NodeSource repository."; exit 1; }

# Update apt
sudo apt-get update || { echo "Failed to update apt."; exit 1; }

# Install Node.js with error handling
sudo apt-get install nodejs -y || { echo "Failed to install Node.js."; exit 1; }

# Enable corepack (interactive step)
sudo su
corepack enable
exit

# Setup pnpm
pnpm setup || { echo "Failed to setup pnpm."; exit 1; }

# Install TypeScript and TypeScript Language Server
pnpm install -g typescript typescript-language-server || { echo "Failed to install TypeScript and TypeScript Language Server."; exit 1; }

# Install Live grep (ripgrep)
# Download and install ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb || { echo "Failed to download ripgrep."; exit 1; }
sudo dpkg -i ripgrep_13.0.0_amd64.deb || { echo "Failed to install ripgrep."; exit 1; }

# Install File search (fd)
sudo apt install fd-find || { echo "Failed to install fd-find."; exit 1; }

# Install C compiler
sudo apt install gcc || { echo "Failed to install C compiler."; exit 1; }

# Install libstdc++
sudo apt install libstdc++-12-dev || { echo "Failed to install libstdc++-12-dev."; exit 1; }

# Install Nerd Fonts
# (Refer to the Nerd Fonts documentation for manual configuration steps)

# Sync clipboard between OS and Neovim
# Choose the appropriate clipboard tool based on the display server in use

# For Wayland
sudo apt install wl-clipboard || { echo "Failed to install wl-clipboard."; exit 1; }

# For X11
# sudo apt install xclip || { echo "Failed to install xclip."; exit 1; }

# Clean up temporary files
rm ripgrep_13.0.0_amd64.deb || { echo "Failed to remove temporary files."; exit 1; }

# Installation completed successfully
echo "Neovim configuration and dependencies installed successfully!"
