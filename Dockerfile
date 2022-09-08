
# syntax=docker/dockerfile:1

# Installing Archlinux
FROM archlinux

# Basic Configurations
RUN echo "PlanarDeck" > /etc/hostname
RUN pacman -Sy
RUN pacman -Syyu --noconfirm
RUN pacman -S base-devel git ripgrep fd fish neovim emacs xorg --noconfirm

RUN useradd --create-home\
            --shell /bin/fish\
            --no-log-init\
            -g root\
            planetraveller
            #-G sudo\
RUN echo 'planetraveller:e' | chpasswd
USER planetraveller
WORKDIR /home/planetraveller

# ENV DOOMDIR=~/Literacy/Descent
ENV PATH=~/.emacs.d/bin:$PATH

# Installing Doom Emacs
RUN git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
# RUN chown root:root -R ~/.emacs.d
# RUN cd ~/.emacs.d/.local/ && ls -a
# RUN pwd
RUN ~/.emacs.d/bin/doom install --force
# RUN ~/.emacs.d/bin/doom upgrade
# RUN ~/.emacs.d/bin/doom sync
