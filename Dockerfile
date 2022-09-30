FROM ghcr.io/neotrade-ts/qwc-uwsgi-base:alpine-latest

ADD . /srv/qwc_service

# git: Required for pip with git repos
RUN \
    apk add --no-cache --update --virtual build-deps git && \
    pip3 install --no-cache-dir -r /srv/qwc_service/requirements.txt && \
    apk del build-deps

ENV SERVICE_MOUNTPOINT=/auth
