CHAOS_ID=$1

# Create cicd app K8s Manifest file

cat <<EOF > cicd-app-conf.yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ${CHAOS_ID}-cicd-chaos-app
  labels:
    app: ${CHAOS_ID}-cicd-chaos-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ${CHAOS_ID}-cicd-chaos-app
  template:
    metadata:
      labels:
        app: ${CHAOS_ID}-cicd-chaos-app
    spec:
      containers:
      - name: ${CHAOS_ID}-cicd-chaos-app
        image: ariv3ra/cicd-chaos
        ports:
        - containerPort: 5000
---
apiVersion: v1
kind: Service
metadata:
  name: cicd-chaos-external
spec:
  type: LoadBalancer
  selector:
    app: cicd-chaos
  ports:
  - name: http
    port: 80
    targetPort: 5000
    nodePort : 30001
EOF

# Authntivate to DO 
doctl auth init -t $DIGITAL_OCEAN_TOKEN

# Get and save the K8s Cluster
doctl kubernetes cluster kubeconfig save $DIGITAL_CLUSTER_NAME

# # Create the a K8s namespace
# kubectl create namespace cicd-app

#Deploy the cici-app to the Cluster
kubectl apply -f cicd-app-conf.yaml 
