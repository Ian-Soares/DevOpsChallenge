#!/bin/bash

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring

#kubectl port-forward svc/prometheus-kube-prometheus-prometheus -n monitoring 9090
#kubectl port-forward svc/prometheus-grafana -n monitoring 3001:80