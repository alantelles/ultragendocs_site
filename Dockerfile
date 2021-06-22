FROM alantelles/ultragen:06-22-pre
RUN apt update && apt install nginx -y
WORKDIR /application
COPY . .
RUN mv nginx-server-conf /etc/nginx/sites-available/
WORKDIR /etc/nginx/sites-enabled
RUN ln -s /etc/nginx/sites-available/nginx-server-conf nginx-server-conf
RUN /etc/init.d/nginx restart
WORKDIR /application
RUN chmod +x docker-entrypoint.sh
CMD ./docker-entrypoint.sh