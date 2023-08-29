# git

```bash
git remote add upstream git@github.com:prometheus/node_exporter.git

git fetch upstream

git merge v1.6.1
```

## build

```bash
docker run -it --rm \
-v $PWD/:/go/src/github.com/prometheus/node_exporter \
-w /go/src/github.com/prometheus/node_exporter \
-e CI_WORKSPACE=/go/src/github.com/prometheus/node_exporter \
registry.cn-qingdao.aliyuncs.com/wod/golang:1.20-alpine \
go mod vendor

docker run -it --rm \
-v $PWD/:/go/src/github.com/prometheus/node_exporter \
-w /go/src/github.com/prometheus/node_exporter \
-e CI_WORKSPACE=/go/src/github.com/prometheus/node_exporter \
registry.cn-qingdao.aliyuncs.com/wod/golang:1.20-alpine \
bash .beagle/build.sh
```

## cache

```bash
# 构建缓存-->推送缓存至服务器
docker run --rm \
  -e PLUGIN_REBUILD=true \
  -e PLUGIN_ENDPOINT=$PLUGIN_ENDPOINT \
  -e PLUGIN_ACCESS_KEY=$PLUGIN_ACCESS_KEY \
  -e PLUGIN_SECRET_KEY=$PLUGIN_SECRET_KEY \
  -e DRONE_REPO_OWNER="open-beagle" \
  -e DRONE_REPO_NAME="node_exporter" \
  -e PLUGIN_MOUNT="./.git,./vendor" \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  registry.cn-qingdao.aliyuncs.com/wod/devops-s3-cache:1.0

# 读取缓存-->将缓存从服务器拉取到本地
docker run --rm \
  -e PLUGIN_RESTORE=true \
  -e PLUGIN_ENDPOINT=$PLUGIN_ENDPOINT \
  -e PLUGIN_ACCESS_KEY=$PLUGIN_ACCESS_KEY \
  -e PLUGIN_SECRET_KEY=$PLUGIN_SECRET_KEY \
  -e DRONE_REPO_OWNER="open-beagle" \
  -e DRONE_REPO_NAME="node_exporter" \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  registry.cn-qingdao.aliyuncs.com/wod/devops-s3-cache:1.0
```