export BASH_SILENCE_DEPRECATION_WARNING=1
export TERM='xterm-256color'
#export LC_ALL='en_US.UTF-8'
#export LC_ALL='C'
#export LANG='C'
export HISTSIZE=8192
export HISTTIMEFORMAT='%F %T '
export HISTIGNORE="c:l:ls:ll:lc:cl:p:history:cd:u:m:mc:mcm"
export HISTCONTROL=ignoredups
export GPG_TTY=$(tty)
unset LS_COLORS

alias a='alias'
alias clear='clear -x'
alias c='clear'
alias ccd='cd'
alias h='hostname'
alias rm='rm -i'
alias t='top'
alias x='cat'
alias m='make'
alias mc='make clean'
alias mcm='make clean; make'
alias mi='make -j install'
alias mj='make -j'
alias mr='make run'
alias mv1='make VERBOSE=1'
alias g='git'
alias gl='git log --oneline --decorate --all --graph'
alias gs='git status'
alias gd='git diff'
alias gt='git difftool'
alias gc='git commit -a -m'
alias sc='screen -U'
alias v='vim'
alias vi='vim'
alias iv='vim'
alias z='tar zxvf'
alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -al'
alias lt='ls -altrh'
alias lns='ln -nfs'
alias cl='clear; ls -l'
alias lc='clear; ls -l'
alias cls='clear; ls'
alias grep='grep --colour=auto'
alias tf='tail -f'
alias p='cd ..; clear; ls -l'
alias ssh8='ssh -L 8888:localhost:8888'
alias rp='cd $(realpath .)'
alias shortps1='export PROMPT_DIRTRIM=3'
alias condainit='source ~/scratch/miniconda3/etc/profile.d/conda.sh && conda activate'

test -s .bashrc.machine && . .bashrc.machine || true

if [ $HOSTNAME ]; then
export PS1='\[\033[01;30m\]${HOSTNAME%%.*}\[\033[00m\]:\[\033[01;38;5;208m\]\w\[\033[00m\]\$ '
else
export PS1='\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;38;5;208m\]\w\[\033[00m\]\$ '
fi

p2() {
for i in {0..63}
do
  printf "%2u : %u 0x%x\n" "$i" "$((1 << $i))" "$((1 << $i))"
done
}

sw() {
s=0
while [[ 1 ]]; do
  echo $s "secs"
  sleep 1
  s=$[$s+1];
done
}

color256() {
for i in {0..255}
do printf "\x1b[38;5;${i}m%-5i\x1b[0m" $i
  if [ $((i % 16)) == 15 ]; then
  echo
  fi
done
echo
}

colortrue() {
awk 'BEGIN{
  s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
  for (colnum = 0; colnum<77; colnum++) {
    r = 255-(colnum*255/76);
    g = (colnum*510/76);
    b = (colnum*255/76);
    if (g>255) g = 510-g;
    printf "\033[48;2;%d;%d;%dm", r,g,b;
    printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
    printf "%s\033[0m", substr(s,colnum+1,1);
  }
printf "\n";
}'
}

gi() {
  if [[ $1 == "tpush" ]]; then
    git push "${@:2}"
  elif [[ $1 == "tpull" ]]; then
    git pull "${@:2}"
  fi
}

