#!/bin/bash
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
fi

NS=$1
FILE=releases/$NS.yaml
if [ ! -f $FILE  ]; then
     echo "File  $FILE not found!"
     exit 0;
fi
echo "Creating helm secrets in $NS"
kubectl apply -f releases/$NS.yaml
echo "Created"

releaseNames=$(kubectl get secret --namespace=$NS --field-selector type=helm.sh/release.v1 -o jsonpath="{.items[*].metadata.labels.name}")

for rn in $releaseNames
do
echo "Creating resources for $rn in $NS"
    helm get manifest $rn | kubectl apply -f -
done
