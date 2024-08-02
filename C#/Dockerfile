ARG IMAGE=ubuntu:22.04

FROM ${IMAGE} AS raw_image

FROM raw_image AS workspace-setup

ARG INTERNAL_WORKSPACE=/dev_env

WORKDIR ${INTERNAL_WORKSPACE}

FROM workspace-setup AS dep-install

ARG DOWNLOAD_URL=https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb

USER root

RUN apt update && apt upgrade -y  && apt install -y wget
RUN wget ${DOWNLOAD_URL} -O /tmp/packages-microsoft-prod.deb && dpkg -i /tmp/packages-microsoft-prod.deb 
RUN apt-get install -y dotnet-sdk-8.0
RUN apt-get install -y aspnetcore-runtime-8.0

FROM dep-install AS cleaning

RUN rm /tmp/packages-microsoft-prod.deb 

FROM cleaning AS set_entrypoint

COPY entrypoint.sh /root/.

ENTRYPOINT ["/root/entrypoint.sh"]



