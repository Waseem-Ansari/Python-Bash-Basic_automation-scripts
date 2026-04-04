#!/bin/bash
######################
echo Hi $(whoami) Welcome
######################
echo Date: $(date)
######################
echo OS: $(uname -a)
######################
###
echo "---------- CPU Usage -----------"
echo "CPU Usage: $(top -bn1 | grep "^%Cpu" | awk '{print 100 - $8 "%" }')"
###
######################
###
echo "---------- Total memory usage ----------"
free -h
###
######################
###
echo "---------- Total disk usage ---------"
df -h
###
######################
###
echo "---------- Top Five Process by CPU Usage ---------"
ps -eo pcpu,pid,user,comm --sort=-pcpu | head -6
###
######################
###
echo "---------- Top Five Process by Memory Usage -------"
ps -eo pmem,pid,user,comm --sort=-pmem | head -6
