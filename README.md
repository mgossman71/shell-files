# shell-files

.bashrc
```bash
# ost-select
alias goopenstack='cd ~/Downloads/OST-Scripts; . ost-select; cd - 1>/dev/null'
# k8s-select
alias gok8s='/usr/local/bin/k8s-select'
```
```bash
# k8s prompt
source /usr/local/Cellar/kube-ps1/0.7.0/share/kube-ps1.sh
# PS1='[\u@\h \W $(kube_ps1)]\$ '
PS1='$(pwd):$(kube_ps1)\$ '
```

```bash
# Git - prompt shows active branch.
export PS1="\h:\\w:\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$ "
```

```bash
HISTSIZE=200000
HISTFILESIZE=$HISTSIZE
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

_bash_history_sync() {
  builtin history -a         #1
  HISTFILESIZE=$HISTSIZE     #2
  builtin history -c         #3
  builtin history -r         #4
}

history() {                  #5
  _bash_history_sync
  builtin history "$@"
}
md() {
  mdv "$1" |less -r
}
PROMPT_COMMAND=_bash_history_sync
```

```bash
function getpodstatus() {
    if (($# != 0))
    then
        watch sh /usr/local/bin/k8s-monitor $1
    else
        context=$(kubectl config current-context)
        watch sh /usr/local/bin/k8s-monitor ${context}
    fi
}
```
