 #### op digital ocean ###############################
 curl -X POST \
  http://188.166.112.55:12000/public/api/v1/houseprice_model/xgboost_pc2/predict \
  --data '{ "features" : {
    "HouseType": "Tussenwoning",
      "kamers": 6,
      "Oppervlakte": 134,
      "VON": 0,
      "PC": "16"
   }}'
  sleep 1.5;
  
##### test run op GCP kubernetes  
curl -X POST \
  http://35.204.65.53:12000/public/api/v1/p321/p321EP/run \
  --data '{
    "param1": 2.9
  }'