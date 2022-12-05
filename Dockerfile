FROM nginx:stable

EXPOSE 80
EXPOSE 443

# install modules
RUN apt-get update
RUN apt-get install certbot python3-certbot-nginx cron -y
RUN apt-get upgrade -y

# SSL
RUN sed -i -e 's/localhost/fans.mywire.org/g' /etc/nginx/conf.d/default.conf

# install crontab
RUN echo "0 0 1 * * certbot renew --renew-hook=\"service nginx restart\"" > crontab.txt
RUN crontab crontab.txt
RUN rm crontab.txt
