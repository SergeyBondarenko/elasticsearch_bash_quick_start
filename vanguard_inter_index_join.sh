#!/bin/bash

HOST="localhost"
PORT=9220
PROT="https"
USER="sentinl"
PASS="password"
INDEX_A="spaceship_parts"
INDEX_B="spaceship_service"


curl -u$USER:$PASS -k -XGET "$PROT://$HOST:$PORT/siren/$INDEX_A/_search" -d'
{
  "query": {
    "bool": {
      "must": [
        {
          "join": {
            "indices": ['$INDEX_B'],
            "on": ["id", "id"],
            "request": {
              "query": {
                "bool": {
                  "must": [
                    {
                      "range": {
                        "end_of_work_date": {
                          "lte": "now+5y"
                        }
                      }
                    }
                  ]
                }
              }
            }
          }
        }
      ]
    }
  }
}'
