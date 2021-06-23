# set GOROOT $HOME/go
# set GOPATH $HOME/go/goroot
# set GO111MODULE on
# set PATH $HOME/go/bin $PATH
# set PATH (stack path --local-bin) $PATH

if type -q rbenv
  set PATH (stack path --local-bin) $PATH
end

set -x PATH $HOME/.fastlane/bin $PATH
set -x PATH /Users/shun/.cargo/bin $PATH
set -x PATH /opt/homebrew/bin $PATH

set -x PATH /Users/shun/.bin $PATH

set ANDROID_HOME $HOME/Library/Android/sdk
set ANDROID_SDK_ROOT $ANDROID_HOME
set -x PATH $ANDROID_HOME/emulator $PATH
set -x PATH $ANDROID_HOME/tools $PATH
set -x PATH $ANDROID_HOME/tools/bin $PATH
set -x PATH $ANDROID_HOME/platform-tools $PATH

if type -q direnv
  eval (direnv hook fish)
end

if type -q starship
  starship init fish | source
end

if type -q go
  set -x PATH $PATH (go env GOPATH)/bin
end

export CLOUDSDK_PYTHON=python3
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"

if type -q rbenv
  status --is-interactive; and source (rbenv init -|psub)
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
set -g fish_user_paths "/opt/homebrew/opt/krb5/bin" $fish_user_paths
set -g fish_user_paths "/opt/homebrew/opt/krb5/sbin" $fish_user_paths
set -g fish_user_paths "/opt/homebrew/opt/libpq/bin" $fish_user_paths
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# Puppeteer
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=(which chromium)

