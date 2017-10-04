FROM python:2.7
LABEL maintainer pohhen

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# requirements.txt should contain all dependencies to install
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh
COPY nop.sh /usr/local/bin/nop.sh
RUN chmod +x /usr/local/bin/nop.sh

# Run in idle process
CMD run.sh
