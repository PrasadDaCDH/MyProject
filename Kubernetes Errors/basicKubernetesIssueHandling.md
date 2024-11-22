Step 1: Understand the Problem
Identify the symptoms:

Application not accessible.
Pods are not running.
High latency or resource issues.
Collect logs and errors:

Look at error messages or application logs.
Get details on failing components.

1>Verify that cluster health
#kubectl get nodes
(all nodes should be in ready state)

2>Ensure the namespaces is active
#kubectl get namespaces

3>list all pods in the namespaces
#kubectl get pods -n namespace_name
Look for pods with statuses like CrashLoopBackOff, Pending, or Error.

4>Checking details of the pod
kubectl describe pod <pod-name> -n <namespace>

5>Checking pod logs
kubectl logs <pod-name> -n <namespace>

6>For multiple containers in the pods
kubectl logs <pod-name> -c <container-name> -n <namespace>

7>Ensure the service is created:
kubectl get svc -n <namespace>

8>Verify the service endpoints:
kubectl describe svc <service-name> -n <namespace>

9>Check for deployment status:
kubectl describe deployment <deployment-name> -n <namespace>

10>Scale replicas to isolate issues:
kubectl scale deployment <deployment-name> --replicas=1 -n <namespace>

11>Check pod connectivity:
  Execute commands in a running pod:
kubectl exec -it <pod-name> -n <namespace> -- /bin/bash
ping <service-name>
curl <service-url>

12>Verify cluster DNS:
Test DNS resolution:
kubectl exec -it <pod-name> -n <namespace> -- nslookup <service-name>

13>Inspect network policies:
Ensure no restrictive network policies block communication:
kubectl get networkpolicy -n <namespace>

14>Check node resources:
kubectl describe node <node-name>
Look for insufficient CPU, memory, or disk issues.

15>Inspect kube-system pods:
kubectl get pods -n kube-system
Ensure critical components like kube-dns, kube-proxy, and coredns are running.

16>Verify events for insights:
kubectl get events -n <namespace>

17>Enable verbose logging:
Use -v for more details in commands:
kubectl get pods -n <namespace> -v=8

18>Check API server status:
kubectl cluster-info
Ensure all master components are accessible.

19>Debug with tools:
Use kubectl-debug for debugging pods:
kubectl-debug <pod-name> -n <namespace>
Install tools like k9s for a TUI interface.

20>Validate storage integration:
Check PersistentVolume (PV) and PersistentVolumeClaim (PVC) states:
kubectl get pvc -n <namespace>
kubectl describe pvc <pvc-name> -n <namespace>

21>Check ingress/egress:
Inspect Ingress rules:
kubectl describe ingress <ingress-name> -n <namespace>
Verify LoadBalancer or NodePort services are accessible.
