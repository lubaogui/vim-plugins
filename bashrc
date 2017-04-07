# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

PS1='\[\033[0;31m\][\[\033[01;32m\]\u\[\033[0;35m\]@\[\033[0;36m\]\h \[\033[1;36m\]\W\[\033[0;31m\]]>\[\033[00m\] '
# Make bash check its window size after a process completes
shopt -s checkwinsize

[ -r "/etc/bashrc_$TERM_PROGRAM" ] && . "/etc/bashrc_$TERM_PROGRAM"
alias ls='ls -G'  
alias ll='ls -lG'  
