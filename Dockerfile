FROM arm32v7/ubuntu:18.04

EXPOSE 22 80 

USER root
RUN apt update
RUN apt install -y openssh-server

COPY sshd_config /etc/ssh/sshd_config
RUN echo "root:root" | chpasswd 

COPY "ssh-ubuntu-entrypoint.sh" /
RUN ["chmod", "+x", "ssh-ubuntu-entrypoint.sh"]

