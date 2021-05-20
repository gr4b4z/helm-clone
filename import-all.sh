#!/bin/bash
NAMESPACES=$(kubectl get namespace -o jsonpath="{.items[*].metadata.name}")

for ns in $NAMESPACES; do
    if  [[ $ns != default ]]; then 
        continue
    fi
    echo "Importing $ns"
    ./import.sh $ns
done