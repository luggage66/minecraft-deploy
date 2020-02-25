This is just a values.yaml + kustomization of the stable/minecraft helm chart for my use.

# Requirements

* helm3 in your path
* kustomize in your path
* kubectl configured for your cluster

# Deploying

1. Create a `secret-values.yaml` to set the rcon password (or anything else you want to change, like static IPs)

```yaml
minecraftServer:
  rcon:
    password: "my strong password"
```

2. `kubectl create ns minecraft` - Create the namespace
3. `make deploy` - Deploy helm chart


# Cleanup

1. `make undeploy` - will delete the helm chart, but leave the namespace
2. `kubectl delete ns` - Delete the namespace (your PVCs will be deleted)