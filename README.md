# cicd-chaos
===

This is the code repo for the Gremlin Conf CI/CD Pipeline and Chaos Experiments workshop. The sectoion below will guide you through the different exercises in this workshop

## Technologies

- CircleCI
- Gremlin
- DigitalOcean Kubernetes
- Scan (Open Source Security tool)

## Workshop Outline

There are two exercises in this workshop:

- Exercise 1: Build Simple CI/CD Pipeline on CircleCI
- Exercise 2: Applying Chaos concepts into CI/CD

## Exercise 1

In this exercise you'll learn the basics of the `config.yml` and how to build a CI/CD pipeline in the CircleCI platform.

### Exercise 1 Outline

- Setup Project Environment Variables
- Clone GitHub Repository
- Connect repo with CircleCI
- Create Project Environment Variables
- Config.yml Walkthrough
- Commit + Push Code
- Automated Tests - Unit Tests
- Scan Application for Vulnerabilities
- Build Docker Image
- Scan Docker Image

### Setup Project Environment Variables

This CI/CD pipeline integrates with multiple systems which required access to those systems. CircleCI enables secure capture and assignment of sensitive data and credentials. In this project we're connecting to multiple systems and services which requires you to create [Environment Variables][2] so create the following environment variables using the CircleCI Platform. All of the values for these environment variables will be supplied to you from the workshop instructors **except** for the `USER_NAME` variable which you must define using only **lower** case characters and **numbers**. Setup the environment variables [using these instructions:][2]

- DIGITAL_CLUSTER_NAME
- DIGITAL_OCEAN_TOKEN
- GREMLIN_API_KEY
- GREMLIN_TEAM_ID
- USER_NAME	(Value of your choosing MUST be **lowercase** character and numbers)


### Hello World config.yml

This repo starts with the config.yml that hosts a simple pipeline example called hello world. It is a simple build that basically echos the string `"Hello World"`. It's intended to demonstrate a very simple example of a CircleCI pipeline file.

### Clone this Repo 

Clone this repo locally

### Connect this repo to CircleCI

Sign-up for CircleCI and connect this project to your [CircleC Account][1]

### Exercise 1 config.yml

CircleCI only executes the `config.yml` found in the `.circleci/` directory which means that you'll have to modify the config.yml found in the `.circleci/` directory with the content found in the `ex1_config.yml` file found in the `pipeline-configs/` directory. 

You can copy and paste the contents from the `ex1_config.yml` into the `.circleci/config.yml` file or you can run the `ex1_to_config.sh` script which copies the exercise 1 file into the appropriate directory. To use the script run this command from the root of this repo (Linux or MacOS):

```
./ex1_to_config.sh
```

### Trigger the Exercise 1 Pipeline on CircleCI

Which ever copy method you chose you must run a `git commit` & `git push` of the modified `.circleci/config.yml` in order for CircleCI to execute the Exercise 1 CI/Cd pipeline. Once the git push is executed you can observe your build execute the directives inside the config.yml file.

### Exercise 1 Summary

In this exercise you learned about CircleCI config.yml files and how to create useful environment variables used to integrate external services into your pipeline build jobs.

## Exercise 2

In this exercise you'll learn how to apply Chaos concepts into CI/CD pipelines.

### Exercise 2 config.yml

CircleCI only executes the `config.yml` found in the `.circleci/` directory which means that you'll have to modify the config.yml found in the `.circleci/` directory with the content found in the `ex2_config.yml` file found in the `pipeline-configs/` directory. 

You can copy and paste the contents from the `ex2_config.yml` into the `.circleci/config.yml` file or you can run the `ex2_to_config.sh` script which copies the exercise 1 file into the appropriate directory. To use the script run this command from the root of this repo (Linux or MacOS):

```
./ex2_to_config.sh
```

### Trigger the Exercise 2 Pipeline on CircleCI

Which ever copy method you chose you must run a `git commit` & `git push` of the modified `.circleci/config.yml` in order for CircleCI to execute the Exercise 1 CI/Cd pipeline. Once the git push is executed you can observe your build execute the directives inside the config.yml file.


### Exercise 2 Summary

In this exercise you learned about CircleCI config.yml files and how to integrate Chaos experiments into your CI/CD pipelines.

[1]: https://circleci.com/docs/2.0/getting-started/#setting-up-circleci
[2]: https://circleci.com/docs/2.0/env-vars/#setting-an-environment-variable-in-a-project
[3]: 
[4]: 