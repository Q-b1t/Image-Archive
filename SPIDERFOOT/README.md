# General Notes
The project's cool, but it does not seem to be mantained anymore. I am just containerizing the last stable deployment specified in the repo [here](https://github.com/smicallef/spiderfoot#stable-build-packaged-release).
# Quick Cheatsheet
```
docker build . -t spiderfoot:prod
docker run --rm -it -p 5001:5001 spiderfoot:prod
```

# Docker Compose 
```
docker compose up
```