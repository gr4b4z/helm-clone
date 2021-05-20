#!/bin/bash
NAMESPACES=$(kubectl get namespace -o jsonpath="{.items[*].metadata.name}")
mkdir -p releases
for ns in $NAMESPACES; do
    if  [[ $ns != default ]]; then 
        continue
    fi
    echo "Exporting $ns"
    kubectl get secret --namespace=$ns --field-selector type=helm.sh/release.v1 -o yaml > releases/$ns.yaml
done