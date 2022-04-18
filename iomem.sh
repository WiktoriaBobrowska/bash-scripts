#!/bin/bash

unit=KB
d=1024

while getopts "mg" option; do
	case "$option" in
		m) unit=MB; d=1048576 ;;
		g) unit=GB; d=1073741824 ;;
	esac
done

while read line; do
	name="$(echo $line | awk -F ' : ' '{print $2}')"
	b="$(echo $line | awk '{print $1}' | awk -F'-' '{print "ibase=16;" toupper($2) "-" toupper($1)}' | bc)"
	kb="$(echo scale=4\; $b / \($d\) | bc | awk '{printf("%.4f\n", $0)}')"
	printf "%15s: %15s B %15s %s\n" "$name" "$b" "$kb" "$unit"
done < /proc/iomem

