#!/bin/sh

cat <<EOF | python3 -u
import time, os

m10m =  b' ' * 1024 * 1024 * 50
data = m10m
for i in range(5):
  print("I want more memory")
  time.sleep(5)
  data = data + m10m

print("don't worry, be happy")
while True:
  print("sleeping")
  time.sleep(10)
EOF

