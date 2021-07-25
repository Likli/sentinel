FROM python:3.9-slim-buster
LABEL maintainer="Dash Developers <dev@dash.org>"
LABEL description="Dockerised Sentinel"

COPY . /sentinel

COPY sentinel.conf /sentinel/sentinel.conf

RUN cd /sentinel && \
    pip install -r requirements.txt

ENV HOME /sentinel
WORKDIR /sentinel

ADD share/run.sh /

CMD /run.sh
