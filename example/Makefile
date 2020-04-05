#!/usr/bin/make -f

SHELL := /bin/bash


production-image:
	source .docker \
	   && docker build \
	         -t phlax/docker-example \
		 --build-arg BUILD_IMAGE="production" \
		 --build-arg APP_NAME="$$APP_NAME" \
		 --build-arg APP_USERNAME="$$APP_USERNAME" \
		 --build-arg APP_ROOT="$$APP_ROOT" \
		 --build-arg NODE_VERSION="$$NODE_VERSION" \
		 --build-arg NPM_PKGS="$$NPM_PKGS" \
		 --build-arg EGGS="$$EGGS" \
		 --build-arg BUILD_PKGS="$$BUILD_PKGS" \
		 --build-arg SYSTEM_PKGS="$$SYSTEM_PKGS" \
		 --build-arg APP_CONFIG="$$APP_CONFIG" \
		github.com/phlax/docker-app#master:context


dev-image:
	source .docker \
	   && docker build \
	         -t phlax/docker-example:dev \
		 --build-arg BUILD_IMAGE="dev" \
		 --build-arg APP_NAME="$$APP_NAME" \
		 --build-arg APP_USERNAME="$$APP_USERNAME" \
		 --build-arg NODE_VERSION="$$NODE_VERSION" \
		 --build-arg EGGS="$$DEV_EGGS" \
		 --build-arg BUILD_PKGS="$$BUILD_PKGS" \
		 --build-arg SYSTEM_PKGS="$$SYSTEM_PKGS" \
	      	 --build-arg APP_PKGS="$$DEV_PKGS" \
		 --build-arg APP_CONFIG="$$APP_CONFIG" \
		github.com/phlax/docker-app#master:context
