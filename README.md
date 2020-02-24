# Requirements

* Helm3 in your path
* kustomize in your path
* kubectl configured for your cluster

# Deploying

1. Create a `secret-values.yaml` to set the rcon password (or anything else you want to change, like static IPs)

```yaml
minecraftServer:
  rcon:
    password: "my strong password"
```

2. Create the namespace

```sh
kubectl create ns minecraft
```

3. Deploy

```sh
make deploy
```
