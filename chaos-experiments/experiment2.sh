########################################
# Experiment #2 - Testing non-critical application adservice
#

GREMLIN_TEAM_ID=$1
GREMLIN_API_KEY=$2

curl -i -X POST "https://api.gremlin.com/v1/attacks/new?teamId=${GREMLIN_TEAM_ID}" -H 'Content-Type: application/json;charset=utf-8' -H "Authorization: Key ${GREMLIN_API_KEY}" -d '{"target":{"type":"Random","containers":{"multiSelectLabels":{"app":["adservice"]}},"percent":100},"command":{"type":"blackhole","commandType":"Blackhole","args":["-l","240","-h","^api.gremlin.com","-p","^53"],"providers":[]}}'