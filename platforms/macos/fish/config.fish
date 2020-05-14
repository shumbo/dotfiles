set GOROOT $HOME/go
set GOPATH $HOME/go/goroot
set PATH $HOME/go/bin $PATH
set PATH (stack path --local-bin) $PATH
set -x PATH $HOME/.fastlane/bin $PATH

starship init fish | source

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
