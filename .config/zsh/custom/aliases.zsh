ALIASES="$ZSH_CUSTOM/aliases.zsh"
ZSHRC="~/.zshrc"

alias aa="$EDITOR $ALIASES && srczsh"
alias ag="alias | grep"
alias e="$EDITOR"
alias ff="find . -name"
alias gap="git add --patch"
alias gb="git rev-parse --abbrev-ref HEAD"
alias gch="git checkout"
alias gcm="git commit -m"
alias gct="gch --track"
alias gdc="git diff --cached"
alias gdcs="git diff --cached --stat"
alias gdst="git diff --stat"
alias ghsh="gh dash"
alias gfaf="git fetch --all --force"
alias gla="git log --graph --oneline --decorate --all"
alias glaa="git log --graph --oneline --decorate --all --simplify-by-decoration"
alias gld="git log --pretty=format:\"%h%x09%an%x09%ad%x09%s\""
alias gll="git log --graph --oneline --decorate"
alias gls="git log --stat"
alias ghpc="gh pr create"
alias ghpri="gh pr list --search 'status:success review:required -author:@me -reviewed-by:@me -is:draft' --jq '.[-1].number' --json number"
alias ghprq="gh pr view -w \$(ghpri)"
alias ghpv="gh pr view -w"
alias ghrv="gh repo view -w"
alias gmt="git mergetool"
alias gs="git status"
alias gshs="git show --stat"
alias gsp="git-squash-prune"
alias hg="history -i | grep"
alias jira="acli jira"
alias jtui="jiratui ui"
alias lc="lando composer"
alias lci="lc install"
alias lcr="lc require"
alias lcrd="lc require --dev"
alias lcrm="lc remove"
alias lcu="lc update"
alias ld="lando drush"
alias ldcc="ld cr"
alias ldcx="ld cex -y"
alias ldcy="ld cim -y"
alias ldd="ld deploy"
alias lden="ld en -y"
alias ldg="ld | grep"
alias ldgen="ld gen"
alias ldgg="ld gen | grep"
alias ldpg="ld pml | grep"
alias ldud="ld updb -y"
alias ldun="ld pm-uninstall"
alias ldws="ld ws"
alias lnuke="lrm && lst; n"
alias lrb="lando rebuild -y"
alias lrm="lando destroy -y"
alias lrst="lando restart"
alias lst="lando start"
alias lt="lando terminus"
alias ltd="lt drush"
alias pt="terminus"
alias rmf="rm -f"
alias rmrf="rm -rf"
alias srczsh="source $ZSHRC"
alias zshrc="$EDITOR $ZSHRC && srczsh"

lcden() {
  lando composer require drupal/$1 && lando drush en -y $1
}

lcdun() {
   lando drush pm-uninstal -y $1 && lando composer remove drupal/$1
}

n() {
  # if return value is 0, say "ok"
  if [ $? -eq 0 ]; then
    say -r 200 "done"
    osascript -a "display notification"
  else
    say -r 200 "error"
  fi
}

git-squash-prune() {
  local dry_run=false
  [[ "$1" == "-n" || "$1" == "--dry-run" ]] && dry_run=true

  local primary
  primary=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@') || return 1
  git checkout -q "$primary" || return 1

  git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do
    [[ "$branch" == "$primary" ]] && continue
    mergeBase=$(git merge-base "$primary" "$branch") || continue
    [[ $(git cherry "$primary" $(git commit-tree $(git rev-parse "$branch^{tree}") -p "$mergeBase" -m _)) != "-"* ]] && continue
    if $dry_run; then
      echo "$branch"
    else
      git branch -D "$branch"
    fi
  done
}
