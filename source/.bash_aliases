#alias g2v="awk -F':' '{ print $1" +"$2}'"
alias bae="vim ~/.bash_aliases && source ~/.bashrc"

alias clipb="xclip -sel clip"

alias dc="drush -v cc"
alias dca="drush -v cc all"
alias ddl='drush -y dl'
alias den='drush -v -y en'
alias dev="drush ev"
alias dfc='drush fc'
alias dfcv='drush fc variable | grep'
alias dfd='drush fd'
alias dfe="drush -v -y fe --destination=sites/all/modules"
alias dflld="drush -v @pantheon.food-lifeline.dev"
alias dflll="drush -v @pantheon.food-lifeline.live"
alias dfllt="drush -v @pantheon.food-lifeline.test"
alias dfr='drush -v -y fr'
alias dfra='drush -v -y fra'
alias dfu='drush -v -y fu'
alias dfua='drush -v -y fua'
alias dis="drush -v -y dis"
alias dpg="drush pml | grep"
alias dre="drush dre"
alias dry='drush -y'
alias dsql="drush sql-cli"
alias dsqlc="drush -yv sql-create --db-su=root --db-su-pw=w0rk@7r4d"
alias dvg="drush vget"
alias dvs="drush vset"

alias ga="git add"
alias gap="git add -p"
alias gb="git branch"
alias gba="git branch -av"
alias gc="git commit"
alias gcam="git commit -am"
alias gcb="git checkout -b"
alias gch="git checkout"
alias gcm="git commit -m"
alias gd="git diff"
alias gdc="git diff --cached"
alias gdl="git diff --color=always | less -r"
alias gds="git diff --stat"
alias gka="gitk --all &"
alias gl="git log"
alias gla="git log --oneline --decorate --graph --all"
alias gll="git log --oneline --decorate --graph"
alias glp="git log -p"
alias gls="git log --stat"
alias gph="git push"
alias gpl="git pull"
alias gpp="git pull && git push"
alias gs="git status"
alias gsl="git status --color=always | less -r"

#alias ha="beep -f 440 -l 100 -n -f 660 -l 100 -n -f 880 -l 100 -n -f 440 -l 100 -n -f 660 -l 100 -n -f 880 -l 100 -n -f 440 -l 100 -n -f 660 -l 100 -n -f 880 -l 100"

alias nhreset="git reset && git checkout . && rm -Rf nhtrc*"

alias pag="ps aux | grep"

alias rsynca="rsync -rvh --progress"

alias tfe="tail -f /var/log/apache2/$(pwd | awk -F/ '{print $5}')/error.log"

alias vimp="vim -p"
