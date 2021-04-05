# Install wget
yum install wget -y

# Download OC client
export OC_VERSION=4.5.24
wget   https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OC_VERSION/openshift-client-linux-$OC_VERSION.tar.gz -O /usr/local/src/openshift-client-linux.tar.gz

# Unpack
tar -xvzf /usr/local/src/openshift-client-linux.tar.gz -C /usr/local/bin

# Download Argo client
export ARGO_VERSION=2.12.6
wget https://github.com/argoproj/argo/releases/download/v$ARGO_VERSION/argo-linux-amd64.gz -O /usr/local/src/argo-linux-amd64.gz

# Unpack
gunzip /usr/local/src/argo-linux-amd64.gz
mv /usr/local/src/argo-linux-amd64 /usr/local/bin/argo
chmod +x /usr/local/bin/argo

argo version

## Setup Argo client

ARGO_SERVER=webui-argo.apps.demo3.athens.cloudera.com:80
ARGO_NAMESPACE=argo
# ARGO_HTTP1=true
# ARGO_BASE_HREF=/

# Download ArgoCD client
wget https://github.com/argoproj/argo-cd/releases/download/v1.7.12/argocd-linux-amd64 -O /usr/local/bin/argocd
chmod +x /usr/local/bin/argocd

##Install Istioctl
cd /root/
ISTIO_VERSION=1.9.0
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.9.0 TARGET_ARCH=x86_64 sh -
cp /root/istio-$ISTIO_VERSION/bin/istioctl /usr/local/bin/istioctl
chmod +x /usr/local/bin/istioctl


## Install kn (knative) cli
wget https://mirror.openshift.com/pub/openshift-v4/clients/serverless/latest/kn-linux-amd64-0.19.1.tar.gz -O /usr/local/src/kn-linux-amd64-0.19.1.tar.gz
mkdir /usr/local/src/kncli/
tar -xvzf /usr/local/src/kn-linux-amd64-0.19.1.tar.gz -C /usr/local/src/kncli/
cp /usr/local/src/kncli/kn /usr/local/bin/kn
chmod +x /usr/local/bin/kn

## Install Helm
HELM_VERSION=3.5.2
wget https://get.helm.sh/helm-v$HELM_VERSION-linux-amd64.tar.gz -O /usr/local/src/helm-v$HELM_VERSION-linux-amd64.tar.gz
mkdir /usr/local/src/helm
tar -xvzf /usr/local/src/helm-v$HELM_VERSION-linux-amd64.tar.gz -C /usr/local/src/helm
cp /usr/local/src/helm/linux-amd64/helm /usr/local/bin/helm
chmod +x /usr/local/bin/helm

## Install Rancher CLI
RCLI_VERSION=2.4.10
wget https://github.com/rancher/cli/releases/download/v$RCLI_VERSION/rancher-linux-amd64-v$RCLI_VERSION.tar.gz -O /usr/local/src/rancher-linux-amd64-v$RCLI_VERSION.tar.gz
mkdir /usr/local/src/rcli/
tar -xvzf /usr/local/src/rancher-linux-amd64-v$RCLI_VERSION.tar.gz -C /usr/local/src/rcli
cp /usr/local/src/rcli/rancher-v$RCLI_VERSION/rancher /usr/local/bin/rancher
chmod +x /usr/local/bin/rancher

## Install tekton cli
TKN_VERSION=0.16.0
wget https://github.com/tektoncd/cli/releases/download/v$TKN_VERSION/tektoncd-cli-"$TKN_VERSION"_Linux-64bit.rpm -O /usr/local/src/tektoncd-cli-"$TKN_VERSION"_Linux-64bit.rpm
rpm -Uvh /usr/local/src/tektoncd-cli-"$TKN_VERSION"_Linux-64bit.rpm

STERN_VERSION=1.14.0
wget https://github.com/stern/stern/releases/download/v$STERN_VERSION/stern_"$STERN_VERSION"_linux_amd64.tar.gz -O /usr/local/src/stern_"$STERN_VERSION"_linux_amd64.tar.gz
mkdir /usr/local/src/stern/
tar -xvzf /usr/local/src/stern_"$STERN_VERSION"_linux_amd64.tar.gz -C /usr/local/src/stern
cp /usr/local/src/stern/stern_"$STERN_VERSION"_linux_amd64/stern /usr/local/bin/stern
chmod +x /usr/local/bin/stern

## Install GO
yum install go -y