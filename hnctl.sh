#!/bin/bash

machineid=$(cat /etc/machine-id)
icon=$(cat /etc/machine-info | grep ICON)
chassis=$(cat /etc/machine-info | grep CHASSIS)
bootid="8f9db205-72fe-4a39-a634-6886f6168e18"
#bootid=$(cat /proc/sys/kernel/random/boot_id)
virt=$(virt-what)
opsys=$(cat /etc/os-release | grep PRETTY_NAME | cut -c 14-)
cpe=$(cat /etc/os-release | grep CPE | cut -c 12-)
kern=$(uname -rs)
arch=$(uname -p)

echo Static hostname: $HOSTNAME
if [[ -e /etc/machine-info ]];
then
	echo "Icon name: $icon"
	echo "Chassis: $chassis"
else
	echo "Icon name: "
	echo "Chassis: "
fi

echo "Machine ID: $machineid"
echo "Boot ID: $bootid"
echo "Virtualization: $virt"
echo "Operating System: ${opsys::-1}"
if [[ $cpe == '' ]];
then
        echo "CPE OS Name: "
else
        
        echo "CPE OS Name: ${cpe::-1}"
fi
echo "Kernel: $kern"
echo "Architecture: $arch"
