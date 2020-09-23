########################################
# Chaos Experiment #1 - Increase CPU to all nodes for 4 mins (240 seconds) for 80%
#

GREMLIN_TEAM_ID=$1
GREMLIN_API_KEY=$2
CIRCLE_USERNAME=$3


curl -i -X POST "https://api.gremlin.com/v1/attacks/new?teamId=${GREMLIN_TEAM_ID}" -H 'Content-Type: application/json;charset=utf-8' -H "Authorization: Key ${GREMLIN_API_KEY}" -d '{"target":{"type":"Random","containers":{"multiSelectLabels":{"io.kubernetes.container.name":["'"$CIRCLE_USERNAME-cicd-chaos-app"'"]}},"percent":100},"command":{"type":"cpu","commandType":"CPU","args":["-l","120","-p","20","-a"]}}'