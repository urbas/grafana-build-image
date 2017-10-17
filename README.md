[![CircleCI](https://circleci.com/gh/urbas/grafana-build-image/tree/master.svg?style=svg)](https://circleci.com/gh/urbas/grafana-build-image/tree/master)

# How to build Grafana with this image?

```bash
git clone https://github.com/grafana/grafana.git
sudo docker run -it -v $(pwd)/grafana:/go/src/github.com/grafana/grafana urbas/grafana-build-image:1.0.0 /build-grafana.sh
```

# How to upload to bintray?

```bash
VERSION=x.y.z curl -T dist/grafana_${VERSION}_armhf.deb -umatej:<API_KEY> "https://api.bintray.com/content/matej/deb-packages/grafana/${VERSION}/grafana_${VERSION}_armhf.deb"
```
