function sssh 
  ssh -A -t $argv 'tmux -CC attach || tmux -CC'
end
