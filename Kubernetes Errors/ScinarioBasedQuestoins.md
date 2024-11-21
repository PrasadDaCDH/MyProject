
1> Resource Sharing Challenge:->
  >>
>  >No rsource quota means unessesary memory leaks
>  >Creating multiple Namespaces and allocating them the Resource quota
>  >Using Resource Quota we can set the limit for the namespace
>  >Ask the dev team to do performence benchmarking and allocate the Resource Quota to the Namespaces acoordingly
>  >Now using Reource limits on the pod level the leakage of memory issue can be solved we will only see the error
>  >for the particular pod if it is leaking memory
>  >Share the thread dumps and heap dumps with the dev team and create jira tickit for it so the dev team will
>  >check the applicaiton for the issue and reslove it accordingly so it will not take more memory than necessary



#Creating Namespace in kubectl:

	kubectl create namespace quota-mem-cpu-example

Creating Resource quota on namespace level

		apiVersion: v1
		kind: ResourceQuota
		metadata:
		  name: mem-cpu-demo
		spec:
		  hard:
			requests.cpu: "1"
			requests.memory: 1Gi
			limits.cpu: "2"
			limits.memory: 2Gi

To apply the quota:
	kubectl apply -f quota.yml

To get the resourcequota  for the namespace:
	kubectl get resourcequota mem-cpu-demo --namespace=quota-mem-cpu-example --output=json

#Now set Resource quota on pod level:
	apiVersion: v1
	kind: Pod
	metadata:
	  name: quota-mem-cpu-demo
	spec:
	  containers:
	  - name: quota-mem-cpu-demo-ctr
		image: nginx
		resources:
		  limits:
			memory: "800Mi"
			cpu: "800m"
		  requests:
			memory: "600Mi"
			cpu: "400m"


To check the available clusters:

	kubectl config get-contexts

To set the default context:
	kubectl config use-context <cluster name>
	

2>
EKS application required low latency with RDS database which was in different vpc?
--->
    For this we have seted up the vpc peering connection between the two vpc's
    :--> vpc peeering works for both region and different accounts as well
    --> there will requester and accepter
    --> you also need to edit the routes in route tables
    --> THe cidr range for the both the vpc must be diffrent for it to work

3>
When we wanted to scale the EKS cluster automatically based on CPU and memory usage?
  -->FOr pod autoscaling we can use HPA which increases the pods and decreases the pod as per need
  -->For node autoscaling we can use cluster autoscale which increases the nodes and decreases the nodes
  -->Both of this scaling machanisum are monitoried and configured through cloudwatch
