FROM centos:centos8 
MAINTAINER pmcldr 

RUN yum update -y 
RUN yum install -y python3-pip git openssh-server python3-devel gcc which
RUN pip3 install --upgrade pip
RUN pip3 install boto boto3 cdpcli openstacksdk python-openstackclient 
RUN pip3 install ansible==2.10.5
RUN pip3 install pywinrm
RUN yum -y install krb5-workstation

# copy default configuration files
COPY .ansible.cfg /root/.ansible.cfg
COPY hosts /etc/ansible/hosts
COPY _setup_docker_env.sh /root/_setup_docker_env.sh
COPY _kube_helpers.sh /root/_kube_helpers.sh

# Install kubernetes tools
RUN /root/_setup_docker_env.sh

# Install kubernetes helper functions
RUN echo 'source /root/_kube_helpers.sh' >> /root/.bashrc

CMD [“echo”,”Image created”]
