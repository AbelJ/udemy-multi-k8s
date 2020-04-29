docker build -t abeljm/udemy-multi-client:latest -t abeljm/udemy-multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t abeljm/udemy-multi-server:latest -t abeljm/udemy-multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t abeljm/udemy-multi-worker:latest -t abeljm/udemy-multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push abeljm/udemy-multi-client:latest
docker push abeljm/udemy-multi-client:$SHA

docker push abeljm/udemy-multi-server:latest
docker push abeljm/udemy-multi-server:$SHA

docker push abeljm/udemy-multi-worker:latest
docker push abeljm/udemy-multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=abeljm/udemy-multi-server:$SHA
kubectl set image deployments/client-deployment client=abeljm/udemy-multi-client:$SHA
kubectl set image deployments/worker-deployment worker=abeljm/udemy-multi-worker:$SHA
