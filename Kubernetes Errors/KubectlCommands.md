1>**pod commands**
TO get the pod information 

**kubectl get pods**
**kubectl get pods -o wide** for more detailed info like ip and all
**kubectl get pods -w** will wait for the containers to run

2>**deployment commands**
To get the deployment info

**kubectl get deploy** #to get the deployment name

3>**Secrets management commands**
To create Secret in kubernetes 
:->

**#kubectl create secret docker-restory **

4>**To get the config info of all the kubernetes cluster that kubeconfig is connected to **
#kubectl config view
To switch to the cluster you want

#kubectl use-context Cluster_name


kubectl config use-context my-cluster-name           # set the default context to my-cluster-name

kubectl config set-cluster my-cluster-name           # set a cluster entry in the kubeconfig

# configure the URL to a proxy server to use for requests made by this client in the kubeconfig
kubectl config set-cluster my-cluster-name --proxy-url=my-proxy-url

# add a new user to your kubeconf that supports basic auth
kubectl config set-credentials kubeuser/foo.kubernetes.com --username=kubeuser --password=kubepassword

# permanently save the namespace for all subsequent kubectl commands in that context.
kubectl config set-context --current --namespace=ggckad-s2

# set a context utilizing a specific username and namespace.
kubectl config set-context gce --user=cluster-admin --namespace=foo \
  && kubectl config use-context gce

kubectl config unset users.foo                       # delete user foo






