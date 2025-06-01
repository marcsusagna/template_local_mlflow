# Introduction

Template repository for any ML project needing MLFlow locally for model development. It takes cares of spinning up the MLFlow server in a separate procses from the client notebook developing the model to be able to reuse it over notebooks and collaboration times. 

# How to

## Setting up MLFlow

Run the needed infrastructure using devops/bootstrap.sh 

## Create a client notebook

Develop your model within model_development. Make sure to read the environment variables generated during the infrastructure init as well as the needed python environment

## Continue collaborating

You can shut down the cluster and spin it up again, the generated files will be there when the new server spins up. 