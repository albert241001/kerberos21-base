# krbclient
FROM debian:latest
LABEL version="1.0"
LABEL author="@albert241001"
LABEL subject="krbclient"
RUN apt-get update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y install procps iproute2 tree nmap vim ldap-utils krb5-user libpam-pwquality libpam-mount libnss-ldapd libpam-ldapd nslcd nslcd-utils ldap-utils libpam-krb5
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/startup.sh
WORKDIR /opt/docker
CMD /opt/docker/startup.sh

