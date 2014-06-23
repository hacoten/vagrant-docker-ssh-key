# SSH Server

# Pull base image.
FROM ubuntu:14.04
MAINTAINER hacoten "oidahiroyuki@gmail.com"

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y curl git htop man unzip vim wget sysv-rc-conf openssh-server mlocate sudo

# locate
RUN updatedb

# Create User
RUN useradd --create-home -s /bin/bash docker && \
    echo "docker:docker" | chpasswd
# RUN mkdir -p /home/docker
RUN echo "docker ALL=(ALL) ALL" >> /etc/sudoers.d/docker

# Setup sshd
RUN sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
RUN mkdir -p /var/run/sshd && chmod 755 /var/run/sshd

RUN mkdir -p /home/docker/.ssh
RUN chown docker:docker /home/docker /home/docker/.ssh
ADD keys/id_rsa.docker.pub /home/docker/.ssh/authorized_keys
RUN chown docker:docker /home/docker /home/docker/.ssh/authorized_keys
RUN chmod 755 /home/docker
RUN chmod 700 /home/docker/.ssh
RUN chmod 600 /home/docker/.ssh/authorized_keys
RUN /etc/init.d/ssh start;/etc/init.d/ssh stop

EXPOSE 22 80
CMD ["/usr/sbin/sshd","-D"]

