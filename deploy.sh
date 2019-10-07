docker build -t bee25141/multi-client:latest -t bee25141/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t bee25141/multi-server:latest -t bee25141/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t bee25141/multi-worker:latest -t bee25141/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push bee25141/multi-client:latest
docker push bee25141/multi-server:latest
docker push bee25141/multi-worker:latest

docker push bee25141/multi-client:latest:$SHA
docker push bee25141/multi-server:latest:$SHA
docker push bee25141/multi-worker:latest:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=bee25141/multi-server:$SHA
kubectl set image deployments/client-deployment client=bee25141/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=bee25141/multi-worker:$SHA