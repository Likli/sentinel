FROM python:3.9-slim-buster
LABEL maintainer="HCC Developers"
LABEL description="Dockerised Sentinel"
COPY requirements.txt /sent/requirements.txt

RUN cd /sent; \
 pip install --no-cache-dir -r requirements.txt


ENV HOME /sentinel
WORKDIR /sentinel

ADD share/run.sh /

CMD /run.sh
