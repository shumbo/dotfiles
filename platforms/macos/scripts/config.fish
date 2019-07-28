#!/usr/local/bin/fish

source (pwd)/../shared/fish/functions/console_debug.fish
source (pwd)/../shared/fish/functions/console_info.fish
source (pwd)/../shared/fish/functions/console_warn.fish
source (pwd)/../shared/fish/functions/console_error.fish

console_info "Elevate Privileges"
sudo -v

console_debug "Global Configuration"
# disable smart quotes as they’re annoying when typing code
sudo defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# disable smart dashes as they’re annoying when typing code
sudo defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

console_debug "Scrolling"

# disable “natural” scrolling
sudo defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

console_debug "Three Finger Drag"
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerSwipeGesture -int 1

console_debug "Finder"

# finder: show all filename extensions
sudo defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# finder: allow text selection in Quick Look
sudo defaults write com.apple.finder QLEnableTextSelection -bool true

# Disable the warning when changing a file extension
sudo defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# avoid creating .DS_Store files on network volumes
sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

console_debug "Dock"

# autohide dock
defaults write com.apple.dock autohide -bool true

defaults write com.apple.dock tilesize -int 90

# Hot corners
# Possible values:
# 0: no-op
# 2: Mission Control
# 3: Show application windows
# 4: Desktop
# 5: Start screen saver
# 6: Disable screen saver
# 7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Top left screen corner → Launchpad
defaults write com.apple.dock wvous-tl-corner -int 11
defaults write com.apple.dock wvous-tl-modifier -int 0
# # Top right screen corner → Notification Center
defaults write com.apple.dock wvous-tr-corner -int 12
defaults write com.apple.dock wvous-tr-modifier -int 0
# # Bottom left screen corner → no-op
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0
# # Bottom right screen corner → Desktop
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0
