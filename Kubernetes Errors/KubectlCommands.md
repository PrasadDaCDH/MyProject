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


