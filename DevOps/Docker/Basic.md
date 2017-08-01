# Docker Basics

## What is it?

It's a container. Operators use Docker to run and manage apps side-by-side in isolated containers to get better compute density.

Using containers, everything required to make a piece of software run is packaged into isolated containers.

It makes it so much easier for developers to develop a software and not worry about the enviroment setups, which could take so much time.

## brief explanation of containers

<strong>Image: </strong> lightweight, stand-alone, executable package that includes everything needed to run a piece of software, including the code, a runtime, libraries, environment variables, and config files.

<strong>Container: </strong> a runtime instance of an image—what the image becomes in memory when actually executed.

## Containers vs. virtual machines

Virtual Machines run guest OSs. Because of this reason, it is resource intensive, and resulting disk image and application state is an entanglement of OS settings, system-installed dependencies, and other easy to forget, hard to replicate ephemera.

Container however can share a kernel, and the only information that needs to be in a container image is the executable and its package dependencies, which never need to be installed on the host system. You can manage them individually by running commands like `docker ps`. because they contain all their dependencies, there is no configuration entanglement; a containerized app “runs anywhere.”

## Usage
[Docker Rails Guide](https://docs.docker.com/compose/rails/#connect-the-database)

Inside the `Dockerfile`:
```bash
FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
```

