FROM alpine:latest
RUN apk add --no-cache bash docker-cli
WORKDIR /app
COPY script.sh /app/script.sh
RUN chmod +x /app/script.sh
CMD ["/app/script.sh"]
