FROM       centos:latest
MAINTAINER Eloco <elogicocal@gmail.com>

RUN yum update -y && \
    yum install -y  wget python python-m2crypto libnet libpcap libnet-devel libpcap-devel git gcc epel-release && \
    yum install -y libsodium pwgen && \
    yum clean all
    

RUN git clone http://120.77.146.213:3000/eloco/shadowsocksr_a.git /root/ssr

RUN git clone https://github.com/snooda/net-speeder.git /net-speeder
WORKDIR /net-speeder
RUN sh build.sh
RUN mv net_speeder /usr/local/bin/

WORKDIR /
RUN rm -rf /net-speeder
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/net_speeder
COPY config.json /root/ssr/user-config.json

#RUN yum install -y supervisor
#RUN mkdir -p /var/log/supervisor
#COPY supervisord.conf /etc/supervisord.conf
#CMD ["/usr/bin/supervisord"]
#CMD ["/bin/bash"]
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

