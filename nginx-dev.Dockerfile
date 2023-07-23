FROM nginx:latest

RUN rm /etc/nginx/conf.d/default.conf
COPY ./docker/nginx/conf.dev/production.conf /etc/nginx/conf.d/production.conf
COPY ./docker/nginx/generalconfig /etc/nginx/generalconfig