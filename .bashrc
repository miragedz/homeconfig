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
#PS1='[\u@\h \W]\$ '
#[ -r /home/xerus/.byobu/prompt ] && . /home/xerus/.byobu/prompt   #byobu-prompt#

PS1="\[\e[01;32m\]\u@\[\e[01;31m\]\h \[\e[01;34m\][\w] \`if [ \$? = 0 ]; then echo -e '\[\e[0m\]{\!} \n \[\e[01;32m\]٩(◠◡◠)۶'; else echo -e '\[\e[0m\]{\!} \n \[\e[01;31m\](✖╭╮✖)'; fi\` \[\e[01;34m\]\$\[\e[0m\] "

export PS1

# PATH
PATH=$PATH:$HOME/bin
export PATH

export HISTSIZE=100000
export EDITOR=/usr/bin/vim

##########################
# lANG                   #
# Set Lang Configuration #
##########################
export LANG=en_CA.utf8
export LC_CTYPE="en_CA.utf8"
export LC_NUMERIC="en_CA.utf8"
export LC_TIME="en_CA.utf8"
export LC_COLLATE="en_CA.utf8"
export LC_MONETARY="en_CA.utf8"
export LC_MESSAGES="en_CA.utf8"
export LC_PAPER="en_CA.utf8"
export LC_NAME="en_CA.utf8"
export LC_ADDRESS="en_CA.utf8"
export LC_TELEPHONE="en_CA.utf8"
export LC_MEASUREMENT="en_CA.utf8"
export LC_IDENTIFICATION="en_CA.utf8"
