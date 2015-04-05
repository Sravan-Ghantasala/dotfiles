# This is to contain all the custom aliases for bash

# Setting PS1
PS1="\[$(tput bold)$(tput setf 6)\][\@] \[$(tput setf 3)\]\u : \[$(tput setf 2)\]\w\[$(tput sgr0)\] $ "

# Shortcuts
alias x='exit'
alias rsync='rsync -avzP --stats'

# Setting python3 as default
alias python='python3'

# Editors initialisation
alias gvim='echo sraone\n | gvim &>/dev/null' #gvim with sudo, so dont ask me for password again!
alias gedit='echo sraone\n | gedit &>/dev/null' #gedit
alias idea='$HOME/IDEs/idea/bin/idea.sh &>/dev/null'
alias aptana='$HOME/IDEs/Aptana_Studio_3/AptanaStudio3 &>/dev/null'
alias eclipse='$HOME/IDEs/eclipse/eclipse &>/dev/null'
alias pycharm='$HOME/IDEs/pycharm/bin/pycharm.sh &>/dev/null'

#Fuck you Sudo!
alias fucksudo='echo sraone\n | sudo $(history -p \!\!)'

#multi platform hiccups!
alias cls="clear" # grown with it!


