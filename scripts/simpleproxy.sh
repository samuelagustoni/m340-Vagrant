#!/bin/bash
echo "Starting simpleproxy"
echo "forwarding all tcp requests from 0.0.0.0:5865 to 10.0.2.2:5865"
simpleproxy -L 5865 -R 10.0.2.2:5865 -v 
