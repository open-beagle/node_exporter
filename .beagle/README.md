# git

```bash
git remote add upstream git@github.com:prometheus/node_exporter.git

git fetch upstream

git merge v1.0.1
```

## build

```bash
docker run -it --rm \
-v /go/pkg/:/go/pkg/ \
-v $PWD/:/go/src/github.com/prometheus/node_exporter \
-w /go/src/github.com/prometheus/node_exporter \
-e GOPROXY=https://goproxy.cn \
-e CI_WORKSPACE=/go/src/github.com/prometheus/node_exporter \
registry.cn-qingdao.aliyuncs.com/wod/golang:1.15.6-alpine \
bash .beagle/build.sh
```
