set -x PATH $HOME/.fastlane/bin $PATH
set -x PATH /Users/shun/.cargo/bin $PATH
set -x PATH /Users/shun/.ghcup/bin $PATH
set -x PATH /opt/homebrew/bin $PATH

set -x PATH /Users/shun/.bin $PATH

set ANDROID_HOME $HOME/Library/Android/sdk
set ANDROID_SDK_ROOT $ANDROID_HOME
set -x PATH $ANDROID_HOME/emulator $PATH
set -x PATH $ANDROID_HOME/tools $PATH
set -x PATH $ANDROID_HOME/tools/bin $PATH
set -x PATH $ANDROID_HOME/platform-tools $PATH

# C++
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

# Python
if type -q pyenv
  status is-login; and pyenv init --path | source
  status is-interactive; and pyenv init - | source
end

# Ruby
if type -q rbenv
  status --is-interactive; and rbenv init - fish | source
  set -x PATH /Users/shun/.gem/ruby/3.0.0/bin $PATH
end

if type -q /Library/TeX/texbin
  set -x PATH /Library/TeX/texbin/latexmk $PATH
end

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

# keybind
function fish_user_key_bindings
  bind \cr peco_select_history
  bind \co peco_ghq
  bind \cq peco_z
end

if type -q rbenv
  status --is-interactive; and source (rbenv init -|psub)
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /Users/shun/.ghcup/bin # ghcup-env
