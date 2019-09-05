FROM jwilder/docker-gen

RUN apk add bash

# Make the default docker sock location same as letsencrypt
ENV DOCKER_HOST unix:///var/run/docker.sock

RUN mkdir -p /etc/docker-gen/templates
#RUN wget -qO- https://raw.githubusercontent.com/jwilder/nginx-proxy/master/nginx.tmpl > /etc/docker-gen/templates/nginx.tmpl
COPY nginx.tmpl /etc/docker-gen/templates/nginx.tmpl

COPY start.sh /bin

ENTRYPOINT ["start.sh"]