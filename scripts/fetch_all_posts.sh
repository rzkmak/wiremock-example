#!/bin/bash

curl localhost:9999/posts

for i in {1..100}
do
   curl localhost:9999/posts/$i
done