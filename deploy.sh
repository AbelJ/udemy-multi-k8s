docker build -t abeljm/udemy-multi-client -f ./client/Dockerfile ./client
docker build -t abeljm/udemy-multi-server -f ./server/Dockerfile ./server
docker build -t abeljm/udemy-multi-worker -f ./worker/Dockerfile ./worker
docker push abeljm/udemy-multi-client
docker push abeljm/udemy-multi-server
docker push abeljm/udemy-multi-worker
kubectl apply -f k8s
#kubectl set image deployments/server-deployment server=abeljm/udemy-multi-server
