docker build -t my_ci .

docker run -it --rm \
    -p 8080:80 \
    -e HOOK="docker-compose " \
    -e GITHUB_TOKEN -e GITHUB_REPO \
    -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_DEFAULT_REGION \
    -e SMTP_FROM -e SMTP_TO -e SMTP_HOST -e SMTP_PORT -e SMTP_USER -e SMTP_PASS \
    -v /var/run/docker.sock:/var/run/docker.sock \
    my_ci
