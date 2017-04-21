FROM ubuntu:16.04
COPY ./keyboard /etc/default/keyboard
RUN apt-get update && apt-get install locales locales-all --force-yes --assume-yes
RUN locale-gen ru_RU.UTF-8
ENV LANG ru_RU.UTF-8
ENV LANGUAGE ru_RU:en
ENV LC_ALL ru_RU.UTF-8
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install xubuntu-desktop --force-yes --assume-yes
RUN apt-get update && apt-get install terminator firefox remmina iotop git p7zip-full git-gui htop net-tools iputils-ping telnet chromium-browser  --force-yes --assume-yes
RUN add-apt-repository ppa:webupd8team/sublime-text-3 && apt-get update && sudo apt-get install sublime-text-installer
COPY ./turbovnc*.deb /tmp/turbovnc.deb
RUN dpkg -i /tmp/turbovnc.deb
RUN mkdir /home/dev
VOLUME /home/dev
CMD ["bash"]
EXPOSE 5901
