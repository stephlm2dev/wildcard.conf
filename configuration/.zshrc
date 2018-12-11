# Path to your oh-my-zsh installation.
export ZSH=/Users/stephlm2dev/.oh-my-zsh

# allows you to type Bash style comments on your command line
setopt interactivecomments

# EDITOR
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  sudo svn git git-extras colored-man web-search wd npm gem extract common-aliases taskwarrior k
  scala pip python postgres gulp brew docker composer wp-cli aws heroku zsh-nvm
  zsh-autosuggestions zsh-syntax-highlighting
)

# stephlm2dev: Others usefull plugins but not activated
# drush vagrant

export NVM_LAZY_LOAD=true

# User configuration
export ANDROID_HOME='/usr/local/opt/android-sdk'

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
# export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
export PATH="$(brew --prefix php@7.1)/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=${PATH}:${ANDROID_HOME}/tools/bin
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH="$HOME/.fastlane/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/usr/local/MacGPG2/bin:$PATH"
# export PATH="$(brew --prefix python2)/libexec/bin:$PATH"
export PATH="/usr/bin/python2.7:$PATH"
export GOPATH=$HOME/Documents/Github/go
export GOROOT=/usr/local/opt/go/libexec
export PATH="$GOPATH/bin:$PATH"
export PATH="$GOROOT/bin:$PATH"

# export RBENV_ROOT=/usr/local/var/rbenv
# eval $(docker-machine env default)
export JAVA_HOME=$(/usr/libexec/java_home)

# export PATH=$PATH:/usr/local/mysql/bin
# eval `opam config env`

# eval "$(rbenv init -)"
eval "$(rbenv init - --no-rehash zsh)"

### Tmux
export TERM=xterm-256color

# Slack Token for cstar Industries
export SLACK_TOKEN=<TOKEN_ID>

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export LC_ALL=fr_FR.UTF-8
export LANG=fr_FR.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh  ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion

fpath=(/usr/local/share/zsh-completions $fpath)

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

# For LESS highlight
export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS=" -R "

# For notwaldorf/tiny-care-terminal
# https://github.com/notwaldorf/tiny-care-terminal

# List of accounts to read the last tweet from, comma separated
# The first in the list is read by the party parrot.
export TTC_BOTS='tinycarebot,selfcare_bot,magicrealismbot'

# Use this to have a different animal say a message in the big box.
export TTC_SAY_BOX="yeoman"

export TTC_GITBOT="gitlog"

# List of folders to look into for `git` commits, comma separated.
export TTC_REPOS='<FILL_ME>'

# The max directory-depth to look for git repositories in
# the directories defined with `TTC_REPOS`. Note that the deeper
# the directory depth, the slower the results will be fetched.
export TTC_REPOS_DEPTH=3

# Location/zip code to check the weather for. Both 90210 and "San Francisco, CA"
# _should_ be ok (the zip code doesn't always work -- use a location
# first, if you can). It's using weather.service.msn.com behind the curtains.
export TTC_WEATHER='Paris'

# Set to false if you're an imperial savage. <3
export TTC_CELSIUS=true

# Unset this if you _don't_ want to use Twitter keys and want to
# use web scraping instead.
export TTC_APIKEYS=true

# Refresh the dashboard every 20 minutes.
export TTC_UPDATE_INTERVAL=20

# Note: in tiny-terminal-care < 1.0.7, the recommended variables for the Twitter
# API keys were the ones before. As of 1.0.8, they are deprecated
# (because the names are too generic), but will still be supported
# until the next major version.
export CONSUMER_KEY='<FILL_ME>'
export CONSUMER_SECRET='<FILL_ME>'
export ACCESS_TOKEN='<FILL_ME>'
export ACCESS_TOKEN_SECRET='<FILL_ME>'

################################################################################
#                           START OWN ALIAS                                    #
################################################################################

# Unalias
# unalias rm

# Configuration files
alias vhosts='sudo $EDITOR /etc/hosts'
alias vimrc='$EDITOR ~/.vimrc'
alias tmux.conf='$EDITOR ~/.tmux.conf'
alias http.conf='sudo $EDITOR /etc/apache2/httpd.conf'
alias php.ini='$EDITOR /usr/local/etc/php/5.6/php.ini'

# Directory
alias tmp='cd /private/tmp/'

# Applications
alias dynamoDB='java -Djava.library.path=$HOME/Applications/DynamoDB/DynamoDBLocal_lib -jar /Applications/DynamoDB/DynamoDBLocal.jar -sharedDb -port 8183'
alias git='LC_ALL=en_GB git'

# Software
alias vims='vim -p'
alias viml='vim -S' # load vim session
alias youtube='mpsyt'
alias fileManager='ranger'
alias calendar='cal'
alias serverHTTP='python -m SimpleHTTPServer'
alias cppCompile='c++ -std=c++11 -stdlib=libc++'
alias format='fmt'
alias spotlight='spot'
alias dockerStart='bash --login "/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh"'
alias weather='curl wttr.in'
alias less='less -m -g -i -J --underline-special --SILENT'
alias tscp='tsc -p tsconfig.json'
alias simulator='open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'

# Git alias
alias master='git checkout master'
alias branch='git checkout'

# Utilities
alias untracked='svn st | grep ?'

################################################################################
#                             END OWN ALIAS                                    #
################################################################################

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
function gitignore() { curl -L -s https://www.gitignore.io/api/$@ ;}

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH="$HOME/Library/Caches/heroku/autocomplete/zsh_setup" && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
