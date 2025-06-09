minikube start

minikube addons enable ingress

helm upgrade --install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --set crds.enabled=true

kubectl apply -f manifests/certificates.yaml

kubectl get secrets -n cert-manager root-secret -o jsonpath='{.data.ca\.crt}' | base64 -d > my-ca.crt

helm upgrade mariadb-galera oci://registry-1.docker.io/bitnamicharts/mariadb-galera --install --namespace ctfd --create-namespace --values helm-values/mariadb-galera.yaml

helm upgrade redis oci://registry-1.docker.io/bitnamicharts/redis --create-namespace --install --namespace ctfd --values helm-values/redis.yaml

helm upgrade ctfd ctfd-chart --install --atomic --version 1.0.0 --namespace ctfd --create-namespace --values helm-values/ctfd.yaml
