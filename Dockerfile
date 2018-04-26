FROM ubuntu:latest

MAINTAINER Backelite Team <kevin.tanoh@backelite.com>
ENV USER ktano
ENV APP_DIR "/home/${USER}"

#Update
RUN apt update 
#RUN apt upgrade -y
RUN apt install sudo -y

#Add user
RUN useradd -ms /bin/bash ${USER}
RUN adduser ktano sudo
RUN echo "ktano:test" | chpasswd

#Prepare cmd
RUN mkdir -p ${APP_DIR}/ 
ADD cmd/launch ${APP_DIR}/
RUN chmod +x ${APP_DIR}/launch
RUN chown ${USER}:${USER} /home/${USER}/

USER ${USER}
WORKDIR ${APP_DIR}
RUN ls -r

CMD ["./launch"]