# vintagestory-docker
Unofficial repository for running the Vintage Story server in Docker environments
## Build
```shell script
docker build -t vintagestory-docker:v1.12.5 .
```
## Deploy
```shell script
kubectl -n vintage apply -f deployment.yaml
```