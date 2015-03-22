#
# Usage: ./startcontainer [local|alpha|prod]
# Default value is local.
# 
# Logic:
# 1. check if the old container exists. Stop and delete it if there is.
# 2. check if the old image exists. Delete it if there is.
# 3. create new image based on dockerfile
# 4. start new container based on new image
#

# change to the folder where is dockerfile is located.

IMAGE=jeffreyzksun/nodejs:v0.10.24
CONTAINTER=nodejsserver

echo "Stopping container" ${CONTAINTER}
docker stop ${CONTAINTER}
echo "Deleting container" ${CONTAINTER}
docker rm  ${CONTAINTER}
echo "Deleting image" ${IMAGE}
docker rmi ${IMAGE}
echo "Building image" ${IMAGE}
docker build -t ${IMAGE} .

BUILD_ENV="local"
if [ "$1" == "" ]; then
  	BUILD_ENV="local"
else
	BUILD_ENV=$1
fi

echo "Starting container" ${CONTAINTER} "with" ${BUILD_ENV} "env"
docker run --name ${CONTAINTER} --restart="always" --env build=${BUILD_ENV} -p 8000:80 -v $(pwd):/service/www -d ${IMAGE}
