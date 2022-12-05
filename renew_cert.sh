SERVICE_NAME=`grep container_name docker-compose.yml | cut -d: -f 2 | tr -d ' '`
docker-compose exec -d $SERVICE_NAME certbot -n --nginx -d fans.mywire.org --agree-tos --email worstrocker@gmail.com
