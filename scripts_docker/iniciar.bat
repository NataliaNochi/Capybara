echo "Subindo Aplicações"
docker start pgdb
docker start pgadmin
docker start nflix-api-users
docker start nflix-api-movies
docker start nflix-api-gateway
docker start nflix-web
timeout 5

echo "Subindo Jenkins"
docker run ^
  -u root ^
  --rm ^
  -d ^
  -p 8080:8080 ^
  -p 50000:50000 ^
  -v jenkins-data:/var/jenkins_home ^
  -v /var/run/docker.sock:/var/run/docker.sock ^
  jenkinsci/blueocean
timeout 5

docker ps