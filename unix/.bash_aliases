alias rup='rustup'
alias swipl='swi-prolog.swipl'
alias vim='nvim'

# Git shortcuts

# I'm choosing alias names to try save typing time and improve accuracy e.g. "glg" is quick to type but "glog" would be much slower
alias g='git'
alias gad='git add'
alias glg='git log'
alias gstat='git status'


function gomp() {
    git commit -m "$*" && git push
}

export -f gomp  # I've named it "gomp" as I started with "gcommp" like "Git-COMMit-Push" but removed the 'c' so I don't have to move my finger from g to c when wanting to type fast.

function gamp() {
    git add .
    gomp $*
}

export -f gamp  # Named like "gomp" but includes "git add ." so gets the 'a'

