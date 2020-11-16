# Kubernetes (K8s) playground

A sample K8s playground based on the task [Configure Access to Multiple Clusters](https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/).

## Setting the Stage - Configuration Session

Tune the **playground** cluster configuration with `set-cluster`...

```
kubectl config --kubeconfig=config-playground set-cluster playground --server=http://localhost:8080 --insecure-skip-tls-verify
```

...finishing touches to the **sandbox** context with `set-context`

```
kubectl config --kubeconfig=config-playground set-context sandbox --cluster=playground --namespace=default --user=developer
```

View the result with `kubectl config --kubeconfig=config-demo view`.

Switch the context with `kubectl config --kubeconfig=config-playground use-context sandbox` and finally check your current context with `kubectl config current-context` and you are ready to go!

> Note: You can use the environment variable `KUBECONFIG` to avoid the cumbersome `--kubeconfig` parameter.

You should see something similar to:

```
$ export KUBECONFIG=config-playground
$ kubectl config view --minify
apiVersion: v1
clusters:
- cluster:
    insecure-skip-tls-verify: true
    server: http://localhost:8080
  name: playground
contexts:
- context:
    cluster: playground
    namespace: default
    user: developer
  name: sandbox
current-context: sandbox
kind: Config
preferences: {}
users:
- name: developer
  user: {}
```

## The first pod - Dashboard

Let's continue with two more tools in the K8s ecosystem: The Web UI / Dashboard and Helm.

### Deployment with `kubectl`

We'll deploy the [Web UI (Dashboard)](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/) via `kubectl` first:

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.4/aio/deploy/recommended.yaml
```

You might want to check the latest version directly at the GitHub project [kubernetes/dashboard](https://github.com/kubernetes/dashboard)...

No ports will be publish by default. Run `kubectl proxy` to expose the dashboard.

### Deployment with Helm

> [Helm](https://github.com/helm/helm)
