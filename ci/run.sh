if [ ! -f server.pem ]; then
    echo "Creating certificate...";
    openssl req -new -x509 -keyout server.pem -out server.pem -days 365 -nodes
fi

docker build -t my_ci .

docker run -it --rm \
    -p 8080:80 \
    -e HOOK="docker stop $(docker ps -q); git reset --hard HEAD; git pull; docker-compose start" \
    -e GITHUB_TOKEN -e GITHUB_REPO \
    -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_DEFAULT_REGION \
    -e SMTP_FROM -e SMTP_TO -e SMTP_HOST -e SMTP_PORT -e SMTP_USER -e SMTP_PASS \
    -v /var/run/docker.sock:/var/run/docker.sock \
    my_ci
