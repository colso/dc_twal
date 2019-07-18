# Use an official ubuntu image
FROM ubuntu:latest

ENV container docker

# gcc because we need regex and pyldap
# openldap-devel because we need pyldap
RUN apt-get update -y
RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv && \
        apt-get install -y git 
RUN apt-get install -y language-pack-ko

# update pip
RUN python3.6 -m pip install pip --upgrade && \
        python3.6 -m pip install wheel

RUN apt-get install -y cron
RUN apt-get install -y vim

# pipenv installation
RUN pip3.6 install pipenv
RUN ln -s /usr/bin/pip3.6 /bin/pip
#RUN rm /usr/bin/python
# python must be pointing to python3.6
RUN ln -s /usr/bin/python3.6 /usr/bin/python

RUN pip install --upgrade pip
RUN pip install pymysql
RUN pip install transmissionrpc

COPY ./tr/locale /etc/default/locale
#COPY ./tr/crontab /etc/cron.d/run-script
#RUN chmod 0644 /etc/cron.d/run-script
#RUN crontab /etc/cron.d/run-script
COPY ./tr/run.sh /root/run.sh
RUN chmod 0700 /root/run.sh
#
RUN touch /tmp/temp
RUN mkdir -p /tmp/log/
RUN git clone https://github.com/colso/tm.git /root/tm
RUN rm -rf /root/tm/config.ini
ADD ./tr/ini/config.ini /root/tm/config.ini

CMD ["cron", "-f"]
#/usr/sbin/crond

