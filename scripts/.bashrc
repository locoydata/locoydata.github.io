# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#========= ALIAS ==========

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias b='cd /'


alias c='clear'
alias rm="rm -i" #interactive
alias vi='vim'
alias vibashrc='vim ~/.bashrc'
alias sourcebashrc='source ~/.bashrc'

# Directory
alias cdd='cd $HOME/storage/shared/Download'

# Copy
alias cpb='cp $HOME/storage/shared/Download/bashrc ~/.bashrc && source ~/.bashrc'

# Git
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias ghi='git hi '
alias gss='git status'

alias clone_obwiki='git clone git@github.com:locoydata/_obwiki.git /sdcard/_obwiki'
alias clone_tdwiki='git clone git@github.com:locoydata/_tdwiki.git /sdcard/_tdwiki'

# Install pkg
alias up='pkg update'
alias upg='pkg upgrade'
alias inpkg='pkg install nodejs openssh git vim && npm install -g tiddlywiki && npm install pm2@latest -g'
alias uppkg='npm install -g npm && npm update -g tiddlywiki && npm install pm2@latest -g && pm2 update'

# PM2
alias pms='pm2 stop all'
alias pmd='pm2 delete all'

# Tiddlywiki
alias wp='cd $HOME/storage/shared/_obwiki'
alias pullp='cd $HOME/storage/shared/_wiki/MyPluginStore && echo -e "\033[0;31;1m↓ MyPluginStore\033[0m" && git pull && cd ..'
alias pullmy='cd $HOME/storage/shared/_wiki/mywiki && echo -e "\033[0;31;1m↓ mywiki\033[0m" && git pull &&    cd tiddlers/private && echo -e "\033[0;31;1m↓ mywiki-private\033[0m" && git pull &&    cd ../journals && echo -e "\033[0;31;1m↓ mywiki-journals\033[0m" && git pull &&    cd ../images && echo -e "\033[0;31;1m↓ mywiki-images\033[0m" && git pull && cd ..'
alias pushmy='cd $HOME/storage/shared/_wiki/mywiki && echo -e "\033[0;31;1m+ mywiki\033[0m" &&  git add . && git commit -m "Updates from phone" && git push origin master &&    cd tiddlers/private && echo -e "\033[0;31;1m++ mywiki-private\033[0m" &&  git add . && git commit -m "Updates from phone" && git push origin master &&    cd ../journals && echo -e "\033[0;31;1m++ mywiki-journals\033[0m" &&  git add . && git commit -m "Updates from phone" && git push origin master &&    cd ../images && echo -e "\033[0;31;1m++ mywiki-images\033[0m" &&  git add . && git commit -m "Updates from phone" && git push origin master && cd ..'
alias resetmy='pm2 delete mywiki && cd $HOME/storage/shared/_wiki/mywiki && git checkout .'


#======= TIDDLYWIKI =======

export TIDDLYWIKI_PLUGIN_PATH=$HOME/storage/shared/_wiki/MyPluginStore

function tdhtm {
    pm2 delete "mywiki" # in case it was already running
    cd $HOME/storage/shared/_tdwiki/mywiki # path to where files are stored
    pm2 start --name "mywiki" $PREFIX/lib/node_modules/tiddlywiki/tiddlywiki.js -- --listen port=8090
    
    echo "Starting Wiki... (Browser will open automatically)"
    sleep .9
    xdg-open http://localhost:8090
}




function pull {
    pull_repo "/data/data/com.termux/files/home/storage/shared/_obwiki" "_obwiki"
    pull_repo "/data/data/com.termux/files/home/storage/shared/_tdwiki" "_tdwiki"
}

function push {
    push_repo "/data/data/com.termux/files/home/storage/shared/_obwiki" "_obwiki"
    push_repo "/data/data/com.termux/files/home/storage/shared/_tdwiki" "_tdwiki"
}

function pull_repo {
    local repository_path=$1
    local repository_name=$2

    cd $repository_path || exit

    echo "进入安卓目录$repository_name"
    git add -A && git commit -a -m "android backup: $(date +'%Y-%m-%d %H-%M-%S')"
    git pull
    echo "拉取$repository_name仓库"
    cd /
}
function push_repo {
    local repository_path=$1
    local repository_name=$2

    cd $repository_path || exit

    echo "进入安卓目录$repository_name"
    git add -A && git commit -a -m "android backup: $(date +'%Y-%m-%d %H-%M-%S')"
    git push
    echo "推送到$repository_name仓库"
    cd /
}

