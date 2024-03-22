FROM ubuntu:22.04
LABEL maintainer="Malkar <malkarism@gmail.com>"
RUN apt update \
    && apt install -y sudo curl wget vim locales git-core zsh fonts-powerline \
    && locale-gen en_US.UTF-8 \
    && adduser --quiet --disabled-password --shell /bin/zsh --home /home/devuser --gecos "User" devuser  \
    && echo "devuser:P@ssword1" | chpasswd &&  usermod -aG sudo devuser
USER devuser
COPY scripts/installthemes.sh /home/devuser/installthemes.sh
RUN /home/devuser/installthemes.sh
COPY src/.zshrc /home/devuser/.zshrc
ENV TERM xterm
ENV ZSH_THEME agnoster
CMD ["zsh"]
