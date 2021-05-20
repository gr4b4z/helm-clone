# Clone workload installed through the HELM between clusters 

## Export from source cluster
1. Connect to source cluster using kubectl
2. Run ``` ./export-all.sh  ```
Command will export all namespaces except default into folder releases/.
Each namespace data will be stored in separated file called releases/<namespace_name>.yaml


## Import into target cluster
1. Connect to target cluster using kubectl
2. To import all files stored in releases/ folder run command: ``` ./import-all.sh  ```.
2. To import for specified namespace only, run command: ``` ./import.sh  <namespace_name> ```.