#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#########
# Alias #
#########

alias ls='ls --color=auto'
alias vi='vim '
alias echo='echo -e '

#######
# PS1 #
#######

PS1="\[\e[01;32m\]\u@\[\e[01;31m\]\h \[\e[01;34m\][\w] \`if [ \$? = 0 ]; then echo -e '\[\e[0m\]{\!} \n \[\e[01;32m\]٩(◠◡◠)۶'; else echo -e '\[\e[0m\]{\!} \n \[\e[01;31m\](✖╭╮✖)'; fi\` \[\e[01;34m\]\$\[\e[0m\] "

export PS1

# PATH
PATH=$PATH:$HOME/bin
export PATH

export HISTSIZE=100000
export EDITOR=/usr/bin/vim

