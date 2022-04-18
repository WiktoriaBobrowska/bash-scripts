#!/bin/bash
Year=`date -d 2/02/2021 +%Y`
Month=`date -d 2/02/2021 +%m`
Day=`date -d 2/02/2021 +%d`
Hour=`date -d 2/02/2021 +%H`
Minute=`date -d 2/02/2021 +%M`
Second=`date -d 2/02/2021 +%S`
echo `date -d 2/02/2021`
echo "Current Date is: $Day-$Month-$Year"
echo "Current Time is: $Hour:$Minute:$Second"
