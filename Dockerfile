FROM python:3.9-slim-buster
LABEL maintainer="HCC Developers"
LABEL description="Dockerised Sentinel"
ENV HOME /sentinel
WORKDIR /sentinel

COPY sentinel.conf ./

RUN pip install -r requirements.txt


ADD share/run.sh /

CMD /run.sh
