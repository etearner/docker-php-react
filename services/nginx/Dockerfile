FROM nginx:alpine

#. Set timezone .#
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#. Add some network management tools.#
RUN apk update && apk upgrade && \
    apk --no-cache add iputils-ping curl busybox-extras net-tools
