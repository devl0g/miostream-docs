#/usr/bin/env bash

update_image() {
  docker pull ghcr.io/dadencukillia/miostream/backend:dev | grep -q "Downloaded newer image"
}

run_named() {
  docker run --rm -p 8082:8082 --name openapi-miostream -d ghcr.io/dadencukillia/miostream/backend:dev openapi -p 8082
}

stop_named() {
  docker stop $(docker ps -q -f "name=openapi-miostream")
}

update_image
stop_named > /dev/null 2> /dev/null
run_named

while [ true ]; do
  echo Check

  update_image && \
    echo Downloaded &&
    stop_named &&
    run_named &&
    echo "Restarted"

  sleep 30
done
