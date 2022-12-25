#!/bin/bash

echo "CRIANDO AS IMAGENS..."

docker build -t denilsonpinto/projeto-backend:1.0 backend/.
docker build -t denilsonpinto/projeto-database:1.0 database/.

echo "REALIZANDO O PUSH DAS IMAGENS..."

docker push denilsonpinto/projeto-backend:1.0
docker push denilsonpinto/projeto-database:1.0

echo "CRIANDO SERVIÇOS NO CLUSTER KUBERNETES..."

kubectl apply -f ./services.yml

echo "CRIANDO OS DEPLOYMENTS..."

kubectl apply -f ./deployment.yml