
install docker :
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-fr




check status :
 systemctl status docker



pull images :
 docker pull nginx


list the images:
 docker images ls

container a running instance of an image:
 docker run nginx:latest   // REPOSITORY/TAG

desribe the lists of all running containers:
 docker container ls  //   or sudo docker ps

desribe the lists of all not running containers:
 docker ps -a 

stop container from runnning: 
 docker stop "CONTAINER ID"
 docker stop "NAME"

start container:
 docker start "CONTAINER ID"
 docker start "NAME"

run the container on detach mode :
 docker run -d nginx:latest

map a port to the port of the container:
 docker run -d -p 8080:80 nginx:latest
we can map another port:
 docker run -d -p 8080:80 -p 3000:80 nginx:latest

delete a container:
 docker rm "CONTAINER ID"
 docker rm "NAME"

show all containers even not running ID:
docker ps -aq

delete all those containers: (but not containers that are running you must force it)
docker rm $(docker ps -aq)
delete with force:
docker rm -f $(docker ps -aq)

name a container:
docker run --name website -d -p 3000:80 -p 8080:80 nginx:latest

cmd format layout:
docker ps --format="ID\t{{.ID}}\nNAME\t{{.Names}}\nIMAGE\t{{.Image}}\nPORTS\t{{.Ports}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.CreatedAt}}\nSTATUS\t{{.Status}}\n"
export FORMAT="ID\t{{.ID}}\nNAME\t{{.Names}}\nIMAGE\t{{.Image}}\nPORTS\t{{.Ports}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.CreatedAt}}\nSTATUS\t{{.Status}}\n"
docker ps --format=$FORMAT

mount a folder from local to the container :
website~  docker run --name website -v $(pwd):/usr/share/nginx/html:ro -d -p 8080:80 nginx

cmd to go inside the container:
docker exec -it website bash

create a new container and copy to it volume from the old container :
docker run --name website-copy --volumes-from website -d -p 8081:80 nginx


create a new image:
1. create a DockerFile inside the website project
2. inside the build we must build an image from an existing image not from scrutch
3. docker build --help
4. name the tag and build the image:
website~ docker build -t website:latest .   //("the point is the current directory")
5. docker run --name website -p 8080:80 -d website:latest





























