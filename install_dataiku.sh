## login op machientje
ssh longhowlam@argeweb2

ssh root@178.128.246.140
#may need to add user since you cannot install as root
useradd -m dataikuuser
sudo passwd dataikuuser
HYUJ!uhgt678s
usermod -aG sudo dataikuuser
su - dataikuuser

### get software and unpack
wget https://downloads.dataiku.com/public/studio/5.0.0/dataiku-dss-5.0.0.tar.gz
tar xzf dataiku-dss-5.0.0.tar.gz

########################### install the Dataiku Datascience Studio ##########################
# first install dependencies
sudo apt-get update
sudo -i "/home/dataikuuser/dataiku-dss-5.0.0/scripts/install/install-deps.sh"
# now install the software
dataiku-dss-5.0.0/installer.sh  -d dataikudir -p 11000 
# to use R in DSS, install the R dependencies (takes some time)
sudo -i "/home/dataikuuser/dataiku-dss-5.0.0/scripts/install/install-deps.sh" -without-java -without-python -with-r
dataikudir/bin/dssadmin install-R-integration

########################## install the API deployer
dataiku-dss-5.0.0/installer.sh   -p 12000 -t apideployer -d dataikudir_deployer -l dataiku.lic

########## start the DSS
dataikudir/bin/dss start

########## start the apideployer
dataikudir_deployer/bin/dss start



########################## install the API NODE ############################################
# first install dependencies
sudo -i "/home/dataikuuser/dataiku-dss-4.3.0/scripts/install/install-deps.sh"
dataiku-dss-4.3.0/installer.sh -t api -d dataiku_api -p 12000 -l nfrLonghow_20180706.json

## open poort
sudo iptables -I INPUT 1 -i eth0 -p tcp --dport 12000 -j ACCEPT

## start api node
dataiku_api/bin/dss start

## create key on api node
dataiku_api/bin/apinode-admin admin-key-create

## argeweb
aARZmerM9dkZYP0dUPOHbydAhyR8E4Sq

## Digital ocean
w3ScxfO8BPFXSg5kPxBim0iZWhGhuiMb


##################################################
 ## voorbeeld aanroep

curl -X POST \
  http://188.166.112.55:12000/public/api/v1/house_xgboost/pc2model/predict \
  --data '{ "features" : {
     "HouseType": "Tussenwoning",
      "kamers": 6,
      "Oppervlakte": 134,
      "VON": 0,
      "PC": "16"
  }}'
  
## use jq to parse only result time and version
./api_call.sh |  jq '{pred: .result.prediction, version: .apiContext.serviceGeneration, time: .timing.prediction}'

while true; do ./api_call.sh |  jq '{pred: .result.prediction, version: .apiContext.serviceGeneration, time: .timing.prediction}'; sleep 1.8; done;

  
####### python function exposed ###########################

curl -X POST \
  http://188.166.112.55:12000/public/api/v1/ptest/pfunc/run \
  --data '{
    "param1": 1,
    "param2": 2,
    "param3": 310  }'
  
  
########### plumber ##################
  
curl -X POST "http://188.166.112.55/testlhl2/sum?b=1&a=2" -H  "accept: application/json"
