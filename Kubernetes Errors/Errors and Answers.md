
1>
**ImagePullBackOff** ERROR:
	1>IF the image name is not correct
	2>Image is not present at ECR (docker Hub)
	3>container image is private (secure)
	Solutions:-> TO get the private images you can use **ImagePullSecret** in deployement mainifest and pass the secret here
	

2>
**CrashLoopBackOff**
	1>
 	2>
  	3>
   	4>

Question 1: What causes the error "CrashLoopBackOff" in a Kubernetes pod, and how do you troubleshoot it?
:->
	Indicates that pod is starting and crashing and kubernetes restarting it again and again
	Resolution:
	Check the logs: kubectl logs podname
			kubectl describe pod podname
	Can be related to incorrect envirnment variables
	Failed dependancies
	missconfiguration in containers commands


🔹 Question 2: Why might a Kubernetes pod be stuck in the "Pending" state, and how do you resolve it?
A Kubernetes pod can be stuck in the “Pending” state due to several reasons:
	1.	Insufficient Resources: Not enough CPU/memory on nodes.
	•	Fix: Free up resources or adjust pod’s resource requests.
	2.	Node Affinity/Taints: Node constraints or taints preventing scheduling.
	•	Fix: Check and adjust node affinity, or add tolerations to the pod.
	3.	PVC Binding Issues: Persistent volume claim not bound to a persistent volume.
	•	Fix: Ensure PV is available and matches PVC requirements.
	4.	Image Pull Issues: Unable to pull the container image.
	•	Fix: Verify image name and registry credentials.
	5.	Quota Limitations: Resource quotas preventing new pods.
	•	Fix: Check and adjust resource quotas.
	6.	Scheduler Issues: No suitable node found for the pod.
	•	Fix: Check pod constraints and scheduler logs.
	7.	Pod Priority: Higher-priority pods occupying resources.
	•	Fix: Adjust pod priorities or scale down higher-priority pods.

To troubleshoot, use kubectl describe pod <pod-name> and check events for detailed information.



🔹 Question 3: What does the error "ImagePullBackOff" indicate, and how do you fix it?
The “ImagePullBackOff” error in Kubernetes indicates that the pod is unable to pull the specified container image from the registry, usually due to issues with the image or registry configuration.

Common Causes and Fixes:

	1.	Incorrect Image Name or Tag:
	•	Cause: The specified image name or tag is incorrect, and Kubernetes cannot find it in the registry.
	•	Fix: Verify the image name and tag in the pod configuration are correct. Ensure the image exists in the registry.

image: <correct-image-name>:<correct-tag>


	2.	Authentication Issues (Private Registry):
	•	Cause: The registry requires authentication, but Kubernetes does not have the necessary credentials.
	•	Fix: Create a Docker registry secret and link it to your pod:

kubectl create secret docker-registry <secret-name> --docker-server=<registry-server> --docker-username=<username> --docker-password=<password> --docker-email=<email>

Then, reference this secret in your pod specification:

imagePullSecrets:
  - name: <secret-name>


	3.	Image Not Found in Registry:
	•	Cause: The image is not available in the specified registry.
	•	Fix: Ensure the image exists in the registry and that the registry is accessible.
	4.	Network or Connectivity Issues:
	•	Cause: The node cannot access the registry due to network issues.
	•	Fix: Check the node’s network connectivity and ensure it can access the registry.
	5.	Rate Limiting:
	•	Cause: The registry enforces rate limits, and the pod is exceeding the allowed pull requests.
	•	Fix: Wait for the rate limit to reset or use a different registry with higher limits.

How to Troubleshoot:

	•	Check Pod Events:

kubectl describe pod <pod-name>

Look for error messages related to image pulling.

By identifying and resolving the underlying cause, you can fix the “ImagePullBackOff” error and successfully pull the container image.




🔹 Question 4: How do you resolve the "ErrImagePull" error in Kubernetes?
Resolving "ErrImagePull" in Kubernetes
Common Causes:
 * Image Issues: Incorrect image name, tag, or non-existent image.
 * Network Problems: Connectivity issues between nodes and registry.
 * Authentication Failures: Missing or incorrect credentials.
 * Resource Constraints: Insufficient node resources.
Troubleshooting Steps:
 * Verify Image: Check image name, tag, and registry accessibility.
 * Inspect Network: Ensure network connectivity between nodes and registry.
 * Authenticate: Verify and correct image pull secrets.
 * Check Resources: Adjust node resource limits if needed.
 * Review Logs: Analyze pod and node logs for specific errors.


🔹 Question 5: What might cause a pod to remain in the "Terminating" state indefinitely, and how do you resolve it?
Why Pods Get Stuck in "Terminating" State:
 * Finalizers: Pods with finalizers (e.g., for persistent volumes or config maps) can be stuck if the finalizer controller is unable to complete its tasks.
 * Network Issues: Network connectivity problems can prevent the pod from gracefully shutting down.
 * Node Issues: Node issues like resource constraints or unreachability can hinder the termination process.
 * Kubelet Issues: Problems with the kubelet, the agent that runs on each node, can cause delays in pod termination.
Resolving the Issue:
 * Check Finalizers: Use kubectl describe pod <pod_name> to identify any finalizers. If there are, investigate why they're not being removed.
 * Force Deletion: If the pod is stuck due to finalizers or other issues, you can force delete it using kubectl delete pod <pod_name> --force --grace-period=0.
 * Restart Kubelet: In some cases, restarting the kubelet on the node can resolve issues related to pod termination.
 * Inspect Node and Pod Logs: Check the logs for any errors or warnings that might provide clues about the root cause.
 * Verify Network Connectivity: Ensure that the node where the pod is running can communicate with the API server and other network resources.
 * Address Node Resource Constraints: If the node is under heavy load, consider scaling or upgrading it.


🔹 Question 6: What is a "NodeNotReady" error, and how do you troubleshoot it?
NodeNotReady Error in Kubernetes
A "NodeNotReady" error indicates that a Kubernetes node is not in a state to accept new pods or run existing ones. This can be due to various reasons, including:
 * Network Issues: Problems with network connectivity between the node and the control plane.
 * Resource Constraints: Insufficient CPU, memory, or disk space on the node.
 * Volume Plugin Failures: Issues with storage plugins preventing volume attachment or detachment.
 * Kubelet Issues: Problems with the kubelet, the agent that runs on each node.
Troubleshooting Steps:
 * Check Node Status: Use kubectl get nodes to view the node's status and any conditions.
 * Inspect Node Logs: Examine the logs of the kubelet and other relevant components on the node.
 * Verify Network Connectivity: Ensure the node can communicate with the control plane and other nodes.
 * Check Resource Utilization: Monitor CPU, memory, and disk usage on the node.
 * Inspect Volume Plugin Logs: If volume-related issues are suspected, check the logs of the relevant volume plugins.
 * Restart Kubelet: In some cases, restarting the kubelet can resolve temporary issues.
 * Re-register Node: If the node is completely unresponsive, you may need to re-register it with the cluster.
Additional Tips:
 * Use a monitoring tool to track node health and resource usage.
 * Implement automated alerts for NodeNotReady events.
 * Consider using node affinity and anti-affinity to distribute pods evenly across nodes.
 * Regularly update Kubernetes components and node software.
By following these steps and considering the potential causes, you can effectively troubleshoot and resolve NodeNotReady errors in your Kubernetes cluster.



🔹 Question 7: How do you address a "PVC not bound" error in Kubernetes?
Resolving "PVC Not Bound" Error:
 * Check PV Availability: Ensure sufficient PVs with matching storage class and access modes.
 * Verify PVC Specifications: Check storage class, access modes, and storage requirements.
 * Inspect Node Capacity: Verify that the node has enough disk space.
 * Examine Volume Plugin: Ensure the volume plugin is functioning correctly.
 * Force Binding (Caution): Manually bind the PVC to a PV, but use with care.
 * Recreate PVC: As a last resort, delete and recreate the PVC.
By following these steps and considering the potential causes, you can effectively troubleshoot and resolve the "PVC not bound" error in your Kubernetes environment.


🔹 Question 8: What does the "Error syncing pod" message mean, and how do you troubleshoot it?


🔹 Question 9: Why might a Kubernetes service not be accessible from within the cluster, and how do you resolve it?
🔹 Question 10: How do you fix the "Failed to create pod sandbox" error?
🔹 Question 11: What causes "FailedScheduling" errors in Kubernetes, and how do you resolve them?
🔹 Question 12: How do you resolve "etcdserver: request timed out" errors in Kubernetes?
🔹 Question 13: Why might a "kubectl exec" command fail, and how do you troubleshoot it?
🔹 Question 14: How do you fix a "service is not external IP" error in Kubernetes?
🔹 Question 15: How do you resolve "certificate signed by unknown authority" errors in Kubernetes?
