alias grmx='git status -s | grep "??" | awk -F " " '"'"'{print $2}'"'"' | xargs rm -rf'
alias gam='git add . && git commit --amend --no-edit'
alias gaf='git add . && git commit --amend --no-edit && git push --force-with-lease'
alias grbo='f() {git rebase --onto $1 HEAD~${2:-1} $(git rev-parse --abbrev-ref HEAD)};f'
alias gbc='git branch | cat'
alias gpf='git push --force-with-lease'
alias 'gp -f'='git push --force-with-lease'
alias gpo='git push -u origin "$(git_current_branch)"'
alias gcbs='f(){A=$@ && git checkout -b feature/$(slugify $A)};f'
alias gcon='f(){git checkout $(git branch | cat | grep $1 -m 1 | sed "s/* //")};f'
