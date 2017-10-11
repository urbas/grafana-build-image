# How to build Grafana with this image?

```bash
git clone https://github.com/grafana/grafana.git
sudo docker run -it -v $(pwd)/grafana:/go/src/github.com/grafana/grafana urbas/grafana-build-image:1.0.0 /build-grafana.sh
```