#!/bin/bash

curl -v POST localhost:9999/__admin/settings -d @global/simulating_real_latency.json --header "Content-Type: application/json"