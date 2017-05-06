# Prompt
# Via: https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt
parse_git_branch() { 
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' 
}

export PS1="\u@\h \[\033[32m\]\w\[\033[34m\]\$(parse_git_branch)\[\033[00m\] \e[2mλ\e[0m "

# Aliases
alias ll='ls -FGlhp'
alias la='ll -a'
cd() { builtin cd "$@"; ll; }
alias cd.='cd ../'
alias cd..='cd ../../'
alias ...='cd ../../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../../'
alias .......='cd ../../../../../../'

alias ~="cd ~"                              # Go Home
alias path='echo -e ${PATH//:/\\n}'         # Echo all executable Paths
mcd () { mkdir -p "$1" && cd "$1"; }        # Makes new Dir and jumps inside
alias DT='tee ~/terminalOut.txt'            # Pipe content to file
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\
\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias prof="$EDITOR ~/.bash_profile"

alias sshf="ssh -t jbroome@fisher.gcc.biostat.washington.edu 'bash -l'"
alias sshp="ssh -t jbroome@pearson.gcc.biostat.washington.edu 'bash -l'"
alias sshws="ssh jbroome@gcc-mac-010.gcc.biostat.washington.edu"

# Settings
set completion-ignore-case On
export EDITOR=/usr/bin/vim

# Git
## Aliases
alias gdn='git diff --name-status'
alias lg1="git log --graph --abbrev-commit --decorate --format=format:\
'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) \
%C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"
alias lg="lg1"
alias lg2="git log --graph --abbrev-commit --decorate --format=format:\
'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)\
%C(reset)%C(auto)%d%C(reset)%n''          \
%C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias lg3="git log --graph --abbrev-commit --decorate --format=format:\
'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)\
%C(reset) %C(bold cyan)(committed: %cD)%C(reset) %C(auto)%d%C(reset)%\
n''          %C(white)%s%C(reset)%n''          %C(dim white)- %an <%ae> \
%C(reset) %C(dim white)(committer: %cn <%ce>)%C(reset)' --all"

## Autocompletion
source .git_completion.sh

## Settings
git config --global diff.mnemonicprefix true
git config --global branch.push.default tracking
git config --global branch.autosetupmerge true
git config --global merge.stat true
git config --global user.email "jb@jaibroome.com"
git config --global user.name "Jai Broome"
git config --global merge.ff false

# Profiles
prof_diff() { 
    DIFF=$(diff $1 $2/$1) 
    if [ "$DIFF" != "" ]  
    then 
        echo "$1 diff:" 
        echo $DIFF 
        # printf "\n" 
        read -p "$1 has been modified. Proceed? (y/n): " yn 
        case $yn in 
            [Yy]* ) cp $2/$1 $1;; 
            [Nn]* ) echo "$1 not updated";; 
            * ) echo "Please answer 'y' or 'n'";; 
        esac 
    fi 
    source $1 
} 
 
export -f prof_diff

PROFILE_ORDER=$PROFILE_ORDER:'.global_profile.sh'
export PROFILE_ORDER
