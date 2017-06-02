# Preferences specific to macOS machines
# Aliases
alias f='open -a Finder ./'
trash () { command mv "$@" ~/.Trash ; } 
ql () { qlmanage -p "$*" >& /dev/null; } 
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

PROFILE_ORDER=$PROFILE_ORDER:'.mac_profile.sh'
export PROFILE_ORDER
