# Docker Containerization Demo

_Containerize backend services using Docker CLI, Dockerfile and Docker Compose_

Demo is based on LinkedIn Learning courses:
- [Learning Docker](https://www.linkedin.com/learning/learning-docker-17236240)
- 

#### Tech stack

- Docker Desktop
- Docker CLI
- Dockerfile
- Docker Compose
- Windows 10
- IntelliJ IDEA

#### Content

* [Preparation](#preparation)
* [CLI basics](#cli-basics)
* [Dockerfile](#dockerfile)
* [Service container](#service-container)


#### Preparation

Before we can use Docker in Windows we have to install Docker Desktop and run it as described
[here](https://docs.docker.com/desktop/install/windows-install/).

Once Docker Desktop is up and running we are ready to go.
Let's open PowerShell and check if docker is available:

- Run `docker version`

![](image/1.PNG)

#### CLI basics

There is an explicit way to create and start container:

- Run `docker container create hello-world:linux`

![](image/2.PNG)

As we can see, `hello-world` image found in docker hub, 
meaning we don't need to create our own image, instead we can use existing one.

- Run `docker ps -a` 

![](image/3.PNG)

We checked for all existing containers and see that our one was successfully created.

- Run `docker container start a53` (replace `a53` with your actual container id)

![](image/4.PNG)

- Run `docker ps -a`

![](image/5.PNG)

We see that our container has exited means it was successfully run and stopped 
as it has no continuous task, just prints some output.
Let's check what was printed:

- Run `docker logs a53` (replace `a53` with your actual container id)

![](image/6.PNG)

In order to enter execution process, we can start container this way:

- Run `docker container start --attach a53`

![](image/7.PNG)

Now, we are going to try shorter way to create and start container:

- Run `docker run hello-world:linux`

![](image/8.PNG)

- Run `docker ps -a`

![](image/9.PNG)

It took just one command to execute container interactively.

#### Dockerfile

Now, we have simple program as `clock.bash` app source [here](application/datetime/src/clock.bash). 
So, we can create container based on our own image 
using `Dockerfile` as [here](application/datetime/Dockerfile).

- Go to `application/datetime` directory
- Run `docker build -t clock-app-image .`

![](image/10.PNG)

From 2 last lines of output we see that image was created and named.
So, we are ready to run new container based on that image:

- Run `docker run clock-app-image`

![](image/11.PNG)

We got simple line output from our application and now can check container state:

- Run `docker ps -a`

![](image/12.PNG)

#### Service container

Now we will interact with app that works continuously like a server.
For this we have `server-clock.bash` app source [here](application/server/src/server-clock.bash)
and corresponding `server-clock.Dockerfile` [here](application/server/server-clock.Dockerfile).

- Go to `server` directory
- Run `docker build -t clock-server-image --file server-clock.Dockerfile .`

![](image/13.PNG)

- Run `docker run --name clock-server-container -d clock-server-image`

![](image/14.PNG)

- Run `docker ps`

![](image/15.PNG)

- Run `docker logs 86f` (replace `86f` with your actual container id)

![](image/16.PNG)

- Run `docker exec 86f date`

![](image/17.PNG)

As our server is running forever, we have to stop it manually:

- Run `docker stop 86f` (replace `86f` with your actual container id)

![](image/18.PNG)

- Run `docker ps -a`

![](image/19.PNG)




