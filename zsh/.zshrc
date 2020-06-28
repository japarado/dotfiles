# If you come from bash you might have to change your $PATH.

export PATH=$HOME/bin:/usr/local/bin:/usr/local/ccache/bin:$(ruby -e 'puts Gem.user_dir')/bin:$HOME/.cargo/bin/:/usr/bin/ctags/:$HOME/.config/composer/vendor/bin:$PATH
export JAVA_HOME=/usr/lib/jvm/default

# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh
export NVM_DIR="$HOME/.nvm"                            # You can change this if you want.
export NVM_SOURCE="/usr/share/nvm"                     # The AUR package installs it to here.
[ -s "$NVM_SOURCE/nvm.sh" ] && . "$NVM_SOURCE/nvm.sh"  # Load NVM


# Path to your oh-my-zsh installation.
export ZSH="/home/pam/.oh-my-zsh"

# Faster Rust compile times 
export RUSTC_WRAPPER=sccache

# FZF and rg 
# export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore'
export FZF_DEFAULT_COMMAND='rg --files --hidden'

# Use nvim as manpager `:h Man`
# export MANPAGER='nvim +Man!'
# export MANWIDTH=999

# Optimus manager
# export __NV_PRIME_RENDER_OFFLOAD=1
# export __GLX_VENDOR_LIBRARY_NAME="nvidia"
# export __VK_LAYER_NV_optimus="NVIDIA_only"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnosterzak"
# ZSH_THEME="lambda-mod"
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
# plugins=(git bundler rust ruby rvm laravel node npm python rails rake cargo composer
#     pip postgres wp-cli)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Custom config start
alias uwu=yay -Syu --noconfirm
alias oof=poweroff
alias rawr=lazygit
alias lamp=activate_lamp
alias lemp=activate_lemp
alias cease=stop_all_servers
alias rmswap=clear_swap_files
alias killorphans=remove_unused_packages
alias updatenode=update_node_version_and_transfer_packages
# # Colors
# RED='\033[0;31m';
# NC='\033[0m';

# Functions
function lazygit() {
    git add .
    git commit
    git push
}

function activate_lamp() {
    echo pam | sudo -S systemctl stop nginx&;
    echo pam | sudo -S systemctl start mariadb httpd php-fpm&;
}

function activate_lemp() {
    echo pam | sudo -S systemctl stop httpd&;
    echo pam | sudo -S systemctl start mariadb nginx php-fpm&;
}

function stop_all_servers () {
    echo pam | sudo -S systemctl stop mariadb nginx php-fpm httpd redis mongodb postgresql&;
}

function clear_swap_files() {
    rm -rf ~/.local/share/nvim/swap/
}

function remove_unused_packages() {
    echo " ${RED} Removing all unused and orphaned packages ${NC}";
    yay -Rns $(yay -Qtdq);
}

function update_node_version_and_transfer_packages() {
    nvm install node --reinstall-packages-from=node;
}

function update_all_pip() {
    pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip install -U;
}

function update_all() {
    update_node_version_and_transfer_packages &&
    update_all_pip &&
    composer global update &&
    gem update &&
    npm -g update &&
    rustup update &&
    yay 
}

function test_microphone() {
    arecord -vvv -f dat /dev/null
}
