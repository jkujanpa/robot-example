FROM        selenium/standalone-chrome

USER        root
# Add user for running tests
#RUN         usermod -a -G 1000 seluser
RUN         apt-get update
#RUN         apt-get install curl -y
#RUN         curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN         apt-get install python2.7 python-pip nano -y

#FROM python:2.7
#LABEL maintainer pohhen

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# requirements.txt should contain all dependencies to install
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

COPY *.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh
RUN ls -la /usr/local/bin
#COPY nop.sh /usr/local/bin/nop.sh
#RUN chmod +x /usr/local/bin/nop.sh

#COPY robot-tests /tmp/tests
#    environment:
ENV  HUB_ADDR=hub
ENV  HUB_PORT=4444
ENV  ROBOT_TESTS=/tmp/tests
ENV  OUTPUT_DIR=/output
# Run in idle process
CMD run.sh
