FROM arm64v8/ubuntu:latest
LABEL maintainer="Bill Clark (bill@billclark.io)"

RUN apt-get update \
 && apt-get install -y \
    zsh \
    wget \
    git \
    vim \
    python3 \
    python3-pip \
    bat \
    dnsutils \
    nano \
 && rm -rf /var/lib/apt/lists/*

# Setup default user environment
ARG USERNAME="lovelace"
ARG USERID="1000"
ARG GROUPID="1000"
RUN groupadd -g $GROUPID -r $USERNAME \
 && useradd --no-log-init -r --gid $GROUPID -u $USERID $USERNAME \
 && mkdir /home/$USERNAME
COPY ./container-dotfiles/zshrc /home/${USERNAME}/.zshrc
COPY ./container-dotfiles /home/${USERNAME}/.dotfiles
RUN chown -R ${USERNAME}:${USERNAME} /home/${USERNAME} \
 && chown -R ${USERNAME}:${USERNAME} /usr/local \
 && echo ${USERNAME}:${USERNAME} | chpasswd \
 && chsh -s /usr/bin/zsh ${USERNAME}
USER ${USERNAME}
ENV HOME="/home/lovelace"
