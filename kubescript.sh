export KUBECONFIG=./mykubeconfig
kubectl config view
kubectl get nodes
kubectl delete deployment atp2 --ignore-not-found=true
kubectl apply -f atp2.yaml
kubectl get services atp2
kubectl get pods
kubectl describe pods
