#!/bin/bash
  
prompt="Please select a cluster:"
#options=( $(find -maxdepth 1 -print0 | xargs -0) )
options=( $(ls | egrep -v 'cache|config' | xargs -0) )

PS3="$prompt "
select opt in "${options[@]}" "Quit" ; do
    if (( REPLY == 1 + ${#options[@]} ))
    then
        break
    elif (( REPLY > 0 && REPLY <= ${#options[@]} )) ; then
        echo  "You picked $opt which is file $REPLY"
        export KUBECONFIG=~/.kube/$opt
        break
    else
        echo "Invalid option. Try another one."
    fi
done
