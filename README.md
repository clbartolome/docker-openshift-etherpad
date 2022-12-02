# Etherpad

> Forked from wkulhanek/docker-openshift-etherpad:master

## Build image

```sh
# Build image
podman build . -t etherpad:1.8.16

# Tag and push into quay
podman tag etherpad:1.8.16 quay.io/calopezb/etherpad:1.8.16
podman push quay.io/calopezb/etherpad:1.8.16
```

## Deploy in OpenShift

```sh
# Deploy Postgres DB
oc apply -k deploy/postgresql/base

# Deploy Etherpad
oc apply -f deploy/etherpad/base
```

## Create a Pad with some content

Useful links:
- API: `<etherpad-url>/api/1/`
- OpenAPI documentation: `<etherpad-url>/api/1/openapi.json`
- Admin: `/admin`

Examples:
- Get APIKEY
```sh
APIKEY=$(oc exec deploy/etherpad -- cat APIKEY.txt)
```

- Create a Pad (no group)
```sh
curl "<etherpad-url>/api/1/createPad?padID=ansible-helm-lifecycle-lab&apikey=$APIKEY"
```

- Add content to created Pad
```sh
curl "<etherpad-url>/api/1/setHTML?padID=ansible-helm-lifecycle-lab&apikey=$APIKEY" --data-urlencode 'html=<!DOCTYPE HTML><html><body><strong><span class="font-size:20">Welcome to Ansible Helm Lifecycle lab!!</span></strong><br><br><strong>Lab instructions:</strong> <a href="https://clbartolome.github.io/ansible-helm-lifecycle-guide/ansible-helm-lifecycle/index.html" >https://clbartolome.github.io/ansible-helm-lifecycle-guide/ansible-helm-lifecycle/index.html</a><br><br><span class="font-size:18"><u>Useful links:</u></span><br><ul class="bullet"><li>Openshift:<a href="http://openshiftconsole.com" >http://openshiftconsole.com</a></li><li>AAP: <a href="http://automationplatform.com" >http://automationplatform.com</a></li><li>Gitea: <a href="http://gitea.com" >http://gitea.com</a></li><li>ArgoCD: <a href="http://argo.com" >http://argo,com</a></li><li>Nexus: <a href="http://nexus.com" >http://nexus.com</a></li><li>Dev Spaces: <a href="http://devspaces.com" >http://devspaces.com</a></ul><br><span class="font-size:18"><u>Users Pool:</u></span><br>Note: user and password are the same<br><ul class="bullet"><li>user1:</li><li>user2:</li><li>user3:</li><li>user4:</li><li>user5:</ul></body></html>'
```
