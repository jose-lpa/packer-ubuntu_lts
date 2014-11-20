# Install Vim editor
apt-get install -y vim

# Customize Bash settings.
cat <<EOF > /home/vagrant/.bashrc
# Colorize the prompt.
yellow=\$(tput setaf 3)
green=\$(tput setaf 2)
blue=\$(tput setaf 104)
bold=\$(tput bold)
reset=\$(tput sgr0)

PS1="\[\$yellow\]\u\[\$reset\]@\[\$green\]\h\[\$reset\]:\[\$blue\$bold\]\w\[\$reset\]\$ "

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options.
export HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
shopt -s histappend

# History size up to 1000 commands.
export HISTSIZE=1000

# Make less more friendly for non-text input files, see lesspipe(1).
[ -x /usr/bin/lesspipe ] && eval "\$(SHELL=/bin/sh lesspipe)"

# Enable color support of ls and also add handy aliases.
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "\$(dircolors -b ~/.dircolors)" || eval "\$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Set your favorite editor here.
VISUAL=vim; export VISUAL
EDITOR=vim; export EDITOR

# Append /usr/local/bin to the path.
export PATH=/usr/local/bin:/usr/local/share/python/:\$PATH
EOF
