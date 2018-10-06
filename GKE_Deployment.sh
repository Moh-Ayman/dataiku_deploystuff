########### install kubernetes cluster ############################

## create
gcloud container clusters create myfirst-cluster

## get access 
gcloud container clusters get-credentials myfirst-cluster

## see the cluster
gcloud container clusters list

## make sure docker can push images
gcloud auth configure-docker

### delete cluster, stop incuring costs
gcloud container clusters delete myfirst-cluster
