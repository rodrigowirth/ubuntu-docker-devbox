alias c='docker-compose'
alias cb='docker-compose build'
alias cup='docker-compose up'
alias cr='docker-compose run --service-ports --rm'
alias crl='docker-compose run --service-ports --rm local'
alias crd='docker-compose run --service-ports --rm develop'
alias crb='docker-compose run --service-ports --rm debug'
alias crt='docker-compose run --rm test'
alias crp='docker-compose run --rm provision'
alias crci='docker-compose run --rm ci'
alias crwt='docker-compose run --rm watchtest'
alias cru='docker-compose run --rm update'
alias cps='docker-compose ps'
alias clogs='docker-compose logs'

alias kurcs="kubectl get rc"
alias kupods="kubectl get pods"
alias kuquiz="kubectl config set-context bravi --namespace production-bravi-quiz"
alias kucloud="kubectl config set-context bravi --namespace production-bravi-cloud"
alias kusuite="kubectl config set-context bravi --namespace production-bravi-suite"
alias kulogs="kubectl logs -f --tail=100"
alias kucreate="kubectl create -f"
alias kunamespaces="kubectl get namespaces"

dockerreset() {
  docker stop $(docker ps -aq)
  docker rm $(docker ps -aq)
}

dockproxy() {
  docker run --privileged=true -d --name dockito-proxy -v /data/dockito-proxy/certs:/etc/nginx/certs -v /var/run/docker.sock:/tmp/docker.sock -p 80:80 -p 443:443 dockito/proxy:latest
}

dockvault() {
  docker run -d -p 172.17.42.1:14242:3000 -v ~/.ssh:/vault/.ssh dockito/vault
}

docketcd2() {
  docker run \
    -d \
    -ti \
    --name etcd2 \
    -p 4001:4001 \
    -p 2379:2379 \
     elcolio/etcd:2.0.10 \
        -name devbox \
        -advertise-client-urls "http://172.17.42.1:2379,http://172.17.42.1:4001" \
        -listen-client-urls "http://0.0.0.0:2379,http://0.0.0.0:4001"
}

updocker() {
  dockproxy
  dockvault
  docketcd2
}
