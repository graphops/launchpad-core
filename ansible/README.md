# ansible-roles

# k0s Ansible Playbook

Create a Kubernetes Cluster using Ansible and vanilla upstream Kubernetes distro [k0s](https://github.com/k0sproject/k0s)

This content of the `k0s-role` is largely based on the work published by [movd](https://github.com/movd) in the [k0s-ansible](https://github.com/movd/k0s-ansible) repo.
## Included Playbooks

`site.yml`:

```ShellSession
$ ansible-playbook site.yml -i inventory/sample/inventory.yml
```

## TODO add output example

Your inventory must include at least one `initial_controller` and one `worker` node. To get a highly available control plane more `controller` nodes can be added. The first initial controller creates tokens that get written to the nodes when the playbook is executed.


## Step by step guide

You can find a user guide on how to use this playbook in the [k0s documentation](https://docs.k0sproject.io/main/examples/ansible-playbook/).

## Example

Create your cluster:

```ShellSession
$ ansible-playbook site.yml -i inventory/sample/inventory.yml
...

## TODO add output example
Connect to your new Kubernetes cluster. The config is ready to use in the `inventory/artifacts` directory:

```ShellSession
$ export KUBECONFIG=/Users/dev/k0s-ansible/inventory/sample/artifacts/k0s-kubeconfig.yml
$ kubectl get nodes -o wide

$ kubectl run hello-k0s --image=quay.io/prometheus/busybox --rm -it --restart=Never --command -- sh -c "echo hello k0s"
hello k0s
pod "hello-k0s" deleted
```

## How to Contribute

Issues and pull requests against this repository are welcomed!
