GREMLIN_CLUSTER_ID=$1
GREMLIN_TEAM_ID=$2
GREMLIN_TEAM_SECRET=$3
DIGITAL_OCEAN_TOKEN=$4

export DIGITAL_CLUSTER_NAME=$GREMLIN_CLUSTER_ID

# Create Gremlin Manifest file

cat <<EOF > gremlin-conf.yaml
---
apiVersion: v1
kind: Secret
metadata:
  name: gremlin-conf
  namespace: gremlin
type: Opaque
stringData:
  GREMLIN_CLUSTER_ID: $GREMLIN_CLUSTER_ID
  GREMLIN_TEAM_ID: $GREMLIN_TEAM_ID
  GREMLIN_TEAM_SECRET: $GREMLIN_TEAM_SECRET
EOF

# Authntivate to DO 
doctl auth init -t $DIGITAL_OCEAN_TOKEN

# Get and save the K8s Cluster
doctl kubernetes cluster kubeconfig save $DIGITAL_CLUSTER_NAME

# Create the Gremlin namespace
kubectl create namespace gremlin

#Deploy the Gremlin Client to the Cluster
kubectl apply -f gremlin-conf.yaml 
kubectl apply -f https://k8s.gremlin.com/resources/gremlin-client-secret.yaml
