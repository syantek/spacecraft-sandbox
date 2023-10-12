# spacecraft-sandbox

Trick-based simulation of spacecraft focused on GNC implementation and testing

This repository contains source code to construct and run spacecraft simulation scenarios, along with a Dockerfile to set up the environment it runs in.

## Setup

### Prerequisites

1. Docker Desktop
2. The Dockerfile from this repository
3. An internet connection
4. Some familiarity with Python, C++, [Trick](https://github.com/nasa/trick) and [JEOD](https://github.com/nasa/jeod)

### Envrionment Setup

The recommended development environment is an Ubuntu 20.04 Docker container that can be created using the Dockerfile in this repository. The environment includes Trick and JEOD set up and ready to go. To get the environment for this project after you have the prerequisites in place:
1. In your command-line shell of choice, run the command `docker build --tag space-sandbox:0.1 [PATH-TO-Dockerfile]` where you substitute in the actual path to your copy of the Dockerfile
2. Docker will take a little while to get everything set up, and after it is done you should have a Docker image that you can run with the command `docker run -it space-sandbox:0.1`
3. You should now be attached to the running docker container in the window you used to enter the command. You can interact with it that way (in which case I recommend installing and getting familiar with tmux in the container), you can attach an instance of Visual Studio Code to the container, or you can do something else.

## Using the Sandbox

Currently, the container loads up ready for you to create Trick + JEOD scenarios with the existing JEOD models. In the very near future, this repository will include some basic models of sensors, actuators, and algorithms, as well as simulation scenarios that put those models together into coherent vehicles in realistic situations.
