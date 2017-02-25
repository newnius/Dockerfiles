FROM ubuntu
RUN apt update \
&& apt install -y openssh-server

RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

ADD bootstrap.sh /etc/bootstrap.sh
CMD ["bash", "/etc/bootstrap.sh"]
