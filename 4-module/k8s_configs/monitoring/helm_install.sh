#!/bin/bash

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm install prometheus prometheus-community/prometheus --namespace prometheus --set alertmanager.persistentVolume.storageClass="gp3" --set server.persistentVolume.storageClass="gp3"
printf 'set admin password: '
read admin_passwd
helm install grafana grafana/grafana --namespace grafana --set persistence.storageClassName="gp3" --set persistence.enabled=true --set adminPassword=$admin_passwd --values ./grafana.yaml --set service.type=LoadBalancer
kubectl port-forward -n prometheus deploy/prometheus-server 8080:9090
