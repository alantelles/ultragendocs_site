FROM alantelles/ultragen:21.09-alpine3.14
RUN apk update && apk add nginx
WORKDIR /application
COPY . .
RUN cp nginx-server-conf /etc/nginx/http.d/nginx-server.conf
RUN rm nginx-server-conf
# WORKDIR /etc/nginx/sites-enabled
# RUN ln -s /etc/nginx/sites-available/nginx-server-conf nginx-server-conf

WORKDIR /application
RUN chmod +x docker-entrypoint.sh
CMD ./docker-entrypoint.sh