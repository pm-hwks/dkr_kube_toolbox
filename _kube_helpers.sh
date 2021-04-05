## Alias
alias k=kubectl
alias kns="kubectl config view --minify | grep namespace"
kns-set() {
  kubectl config set-context --current --namespace=$1
}

## echo 'source /root/_kube_helpers.sh' >> /root/.bashrc