# git

```bash
git remote add upstream git@github.com:kubernetes/kube-state-metrics.git

git fetch upstream

git merge v1.9.7
```

## build

```bash
docker run -it --rm \
-v /go/pkg/:/go/pkg/ \
-v $PWD/:/go/src/github.com/kubernetes/kube-state-metrics \
-w /go/src/github.com/kubernetes/kube-state-metrics \
-e GOPROXY=https://goproxy.cn \
-e CI_WORKSPACE=/go/src/github.com/kubernetes/kube-state-metrics \
registry.cn-qingdao.aliyuncs.com/wod/golang:1.15.6-alpine \
bash -c 'make build-local'
```
