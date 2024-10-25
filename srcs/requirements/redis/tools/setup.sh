#!/bin/bash

sed -i 's/^# maxmemory <bytes>/maxmemory 64mb/' /etc/redis/redis.conf
sed -i 's/^# maxmemory-policy noeviction/maxmemory-policy allkeys-lru/' /etc/redis/redis.conf
sed -i 's/^bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf

redis-server --protected-mode no