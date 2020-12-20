set GOROOT $HOME/go
set GOPATH $HOME/go/goroot
set PATH $HOME/go/bin $PATH
# set PATH (stack path --local-bin) $PATH
set -x PATH $HOME/.fastlane/bin $PATH
set -x PATH /Users/shun/.cargo/bin $PATH

eval (direnv hook fish)

set NODE_EXTRA_CA_CERTS "/Users/shun/Library/Application Support/mkcert/rootCA.pem"

starship init fish | source

source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
export CLOUDSDK_PYTHON=python3

status --is-interactive; and source (rbenv init -|psub)

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
