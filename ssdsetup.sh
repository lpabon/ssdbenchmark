#!/bin/sh

export PATH=$PATH:.

usage()
{
	echo "$0 <device node>"
    exit 0
}

fail()
{
	echo "$1"
	exit 1
}

setup_ssd()
{
	echo "Filling SSD 1 of 2"
	time dd if=/dev/zero of=$1 bs=1024k
	echo "Filling SSD 2 of 2"
	time dd if=/dev/zero of=$1 bs=1024k
}

secure_erase()
{
    hdparm -I $1 | egrep "Model|Serial|Firmware"
    hdparm --user-master u --security-set-pass password $1 || fail "Unable to set password"
    hdparm --user-master u --security-erase password $1 || fail "Unable to erase device"
}

if [ $# -lt 1 ] ; then
	usage
fi

if [ ! -e $1 ] ; then
	usage
fi

secure_erase.sh $1
hdparm -I $1 | egrep "Model|Serial|Firmware"
setup_ssd $1
