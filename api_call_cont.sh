 while true; do
 curl -X POST \
  http://188.166.112.55:12000/public/api/v1/houseprice_model/xgboost_pc2/predict \
  --data '{ "features" : {
    "HouseType": "Tussenwoning",
      "kamers": 6,
      "Oppervlakte": 134,
      "VON": 0,
      "PC": "16"
   }}'  |  jq '{pred: .result.prediction, version: .apiContext.serviceGeneration, time: .timing.prediction}';
   sleep 1.5;
   done;
   