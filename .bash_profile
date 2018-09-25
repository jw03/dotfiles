 Functions
# ---

# If you are in a Shopify repository, this function finds
# the website url and takes you to the '/themes' view
# I use this since I constantly back up themes before pushing code live
www-themes() {
  line="$(grep .*.myshopify.com config.yml | head -n 1 | sed -e 's/store://g' -e 's/.myshopify.com//g')"
  line_clean="$(echo -e "${line}" | tr -d '[:space:]')"
  open https://${line_clean}.myshopify.com/admin/themes
}

# Takes you to the Gitlab website for the current 
# project that you are in
www-gitlab () {
  gitlab_handle="$(git remote -v | head -n 1 | sed 's/.*\/\(.[^.]*\).*/\1/')"; 
  open "https://gitlab.com/barrel/${gitlab_handle}/merge_requests";
}

# Finds the Lando 'https://' url for your current
# project and opens it in a browser
www-lndo () {
  open "$(lando info | grep "https://.*lndo.site" | xargs)"
}

# Aliases
# ---

alias terminus=/Users/max.rolon/vendor/bin/terminus
alias status='git fetch && git status'
alias get-origin='git checkout master; git pull origin master; git checkout develop; git pull origin develop;'
alias bump='git commit -am "Update changelog and bump versions"'
alias sync1='git push origin --follow-tags master:master && git push origin --follow-tags develop:develop'alias branch-name='git rev-parse --abbrev-ref HEAD'
alias docker-kill-all='docker ps --format "{{.ID}}" | xargs docker kill'
alias octal='stat -f %Mp%Lp *'
alias sshkey='cat ~/.ssh/id_rsa.pub | pbcopy'
alias shrug='echo "¯\_(ツ)_/¯" | pbcopy'
alias upstream="git push --set-upstream origin"
alias flow-hs="git flow hotfix start"
alias flow-hf="git flow hotfix finish"
alias flow-rs="git flow release start"
alias flow-rf="git flow release finish"
alias flow-fs="git flow feature start"
alias flow-ff="git flow feature finish"

# Aliases (Project specific)
# ---

alias moscot="cd ~/Sites/moscot/theme"
