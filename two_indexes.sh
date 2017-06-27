#!/bin/bash

HOST="localhost"
PORT=9220
PROT="https"
USER="sentinl"
PASS="password"
INDEX_A="spaceship_parts"
INDEX_B="spaceship_service"

#curl -u$USER:$PASS -k -XDELETE "$PROT://$HOST:$PORT/$INDEX_A"
#curl -u$USER:$PASS -k -XPUT "$PROT://$HOST:$PORT/$INDEX_A"
#curl -u$USER:$PASS -k -XDELETE "$PROT://$HOST:$PORT/$INDEX_B"
#curl -u$USER:$PASS -k -XPUT "$PROT://$HOST:$PORT/$INDEX_B"

curl -u$USER:$PASS -k -XPUT "$PROT://$HOST:$PORT/$INDEX_A/$INDEX_A/1" -d'
{
  "id": 1,
  "type": "spaceship_parts",
  "label": "Fuselage"
}
'
curl -u$USER:$PASS -k -XPUT "$PROT://$HOST:$PORT/$INDEX_A/$INDEX_A/2" -d'
{
  "id": 2,
  "type": "spaceship_parts",
  "label": "Pumps"
}
'
curl -u$USER:$PASS -k -XPUT "$PROT://$HOST:$PORT/$INDEX_A/$INDEX_A/3" -d'
{
  "id": 3,
  "type": "spaceship_parts",
  "label": "Oxidizer"
}
'
curl -u$USER:$PASS -k -XPUT "$PROT://$HOST:$PORT/$INDEX_B/$INDEX_B/1" -d'
{
   "id": 1,
   "produced_date": "2010-09-05",
   "end_of_work_date": "2030-09-05"
}
'
curl -u$USER:$PASS -k -XPUT "$PROT://$HOST:$PORT/$INDEX_B/$INDEX_B/2" -d'
{
   "id": 2,
  "produced_date": "2015-01-01",
  "end_of_work_date": "2022-01-01"
}
'
curl -u$USER:$PASS -k -XPUT "$PROT://$HOST:$PORT/$INDEX_B/$INDEX_B/3" -d'
{
   "id": 3,
  "produced_date": "2016-02-01",
  "end_of_work_date": "2022-02-01"
}
'

curl -u$USER:$PASS -k -XGET "$PROT://$HOST:$PORT/_cat/indices"

