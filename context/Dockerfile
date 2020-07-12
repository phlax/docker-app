# translate/xtle:base
#
# VERSION       0.0.1

ARG BUILD_FROM=debian:buster-slim


# Root stage shared by builder and app images
FROM $BUILD_FROM as root

ARG MAINTAINER="Ryan Northey <ryan@synca.io>"
MAINTAINER $MAINTAINER

ARG APP_USER_ID=1000
ARG APP_NAME=
ARG APP_USERNAME=system
ARG APP_DIR=/app
ARG SYSTEM_PKGS=
ARG LOCALE=en_US.UTF-8
ARG DEB_REPOS=
ARG GPG_KEYS=

ENV DEBIAN_FRONTEND=noninteractive \
    APP_DIR=$APP_DIR \
    APP_NAME=$APP_NAME \
    APP_SRC_DIR=$APP_DIR/$APP_NAME \
    APP_USER_ID=$APP_USER_ID \
    APP_USERNAME=$APP_USERNAME

COPY ./install-root /tmp/build/install-root
RUN /tmp/build/install-root


# Build stage
FROM root as builder

ARG BUILD_PKGS
COPY ./builder /tmp/build
COPY ./bin/* /usr/local/bin/
RUN /tmp/build/install-build-env

ARG EGGS
ARG NPM_PKGS
ARG NODE_VERSION
ARG APP_ROOT
ARG APP_INIT
ARG BUILD_IMAGE
RUN echo "INSTALLING WITH NPM PKGS: $NPM_PKGS"
RUN if [ -n "$APP_USERNAME" ];then su -c "bash /tmp/build/install-env" $APP_USERNAME; fi
RUN rm -rf /tmp/*


# App stage
FROM root

ENTRYPOINT []
# ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
EXPOSE 8000

ARG APP_USERNAME=system

COPY ./install-app /tmp/build/install-app
COPY ./bin/* /usr/local/bin/
COPY --chown=$APP_USERNAME:$APP_USERNAME --from=builder "$APP_DIR" "$APP_DIR"

ARG APP_INSTALL_PRE
ARG APP_PKGS
RUN /tmp/build/install-app

ARG APP_CONFIG
ARG BUILD_IMAGE
ARG NPM_PKGS
ARG ON_CONTAINER_START
ARG RUN_AS_ROOT
ENV BUILD_IMAGE=$BUILD_IMAGE \
        RUN_AS_ROOT=$RUN_AS_ROOT \
	APP_CONFIG=$APP_CONFIG \
	ON_CONTAINER_START=$ON_CONTAINER_START
