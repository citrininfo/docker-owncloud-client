FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install -y gosu wget

RUN echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/Ubuntu_16.04 /' >> /etc/apt/sources.list.d/owncloud-client.list
RUN wget -O- http://download.opensuse.org/repositories/isv:ownCloud:desktop/Ubuntu_16.04/Release.key | apt-key add -

RUN apt-get update

RUN apt-get install -y owncloud-client

RUN apt-get clean

COPY entrypoint.sh /opt/bin/
COPY run.sh /opt/bin/

ENTRYPOINT ["/opt/bin/entrypoint.sh"]
CMD ["/opt/bin/run.sh"]
