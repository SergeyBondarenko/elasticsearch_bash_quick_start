#!/bin/bash

curl -XDELETE 'localhost:9220/places'

curl -XPUT 'localhost:9220/places?pretty' -d'
{
  "mappings": {
    "my_city": {
      "properties": {
        "city": {
          "type": "string",
          "fields": {
            "raw": { 
              "type":  "string",
              "index": "not_analyzed"
            }
          }
        }
      }
    }
  }
}'
curl -XPUT 'localhost:9220/places/my_city/1?pretty' -d'
{
  "city": "New York"
}'
curl -XPUT 'localhost:9220/places/my_city/2?pretty' -d'
{
  "city": "York"
}'
curl -XGET 'localhost:9220/places/_search?pretty' -d'
{
  "query": {
    "match": {
      "city": "york" 
    }
  },
  "sort": {
    "city.raw": "asc" 
  },
  "aggs": {
    "Cities": {
      "terms": {
        "field": "city.raw" 
      }
    }
  }
}'
curl -XGET 'localhost:9220/places/_search?pretty' -d'
{
  "query": {
    "match": {
      "city.raw": "York" 
    }
  }
}'
