set -U fish_greeting ""

export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

set -x PATH /usr/local/bin $PATH
set -x PATH $HOME/.fastlane/bin $PATH
set -x PATH /opt/homebrew/bin $PATH

# --- PROGRAMMING LANGUAGES ---
# Node.js
if type -q volta
  set -gx VOLTA_HOME "$HOME/.volta"
  set -gx PATH "$VOLTA_HOME/bin" $PATH
  set VOLTA_FEATURE_PNPM 1
end

# Haskell
if test -e $HOME/.ghcup/bin
  set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH $HOME/.ghcup/bin # ghcup-env
end

# Python
#if type -q pyenv
  # Add pyenv executable to PATH by running
  # the following interactively:

  #  set -Ux PYENV_ROOT $HOME/.pyenv
  #set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

  # Load pyenv automatically by appending
  # the following to ~/.config/fish/config.fish:

  #pyenv init - | source
  #end

# Go
if type -q go
  set -x PATH $PATH (go env GOPATH)/bin
end

# Perl (Opam)
source /Users/shun/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# --- OTHER TOOLS ---

if type -q starship
  starship init fish | source
end

if type -q /Library/TeX/texbin
  set -x PATH /Library/TeX/texbin/latexmk $PATH
end

if type -q direnv
  eval (direnv hook fish)
end

if test -e /opt/homebrew/Caskroom/google-cloud-sdk
  source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
end

# tabtab source for packages
# uninstall by removing these lines
# Note: Required for pnpm complition
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

# --- KEY BINDINGS ---

function fish_user_key_bindings
  bind \cr peco_select_history
  bind \co peco_select_ghq
  bind \cq peco_z
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

export GPG_TTY=$(tty)

# uv
fish_add_path "/Users/shun/.local/bin"
