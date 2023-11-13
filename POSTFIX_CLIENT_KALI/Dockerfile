ARG IMAGE=kalilinux/kali-rolling:latest 

FROM ${IMAGE} AS kali-img 

FROM kali-img AS root-dir-setup

ARG INTERNAL_WORKSPACE=/smtp_relay

WORKDIR ${INTERNAL_WORKSPACE}

FROM root-dir-setup AS postfix-install

USER root

RUN apt update && \
    apt upgrade -y && \
    apt install -y nano && \
    apt install -y vim && \
    DEBIAN_FRONTEND=noninteractive apt install -y postfix

FROM postfix-install AS entrypoint-setup

COPY entrypoint.sh /root/.

# DO NOT CHANGE THEM FROM HERE, USE THE ENV FILE

ENV SMTP_PORT=465

EXPOSE ${SMTP_PORT}

ENTRYPOINT /root/entrypoint.sh