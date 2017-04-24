# Preferences specific to macOS machines

# Aliases
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

PROFILE_ORDER=$PROFILE_ORDER:".mac_profile.sh"
export PROFILE_ORDER

