docker build -t openapi-miostream-watcher .
docker run -d \
  --name openapi-miostream-watcher \
  -v /var/run/docker.sock:/var/run/docker.sock \
  openapi-miostream-watcher
