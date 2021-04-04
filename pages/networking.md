# Zandra Networking Guide

## A Note on Drivers

The minimal kernel configuration used in Zandra means that your
network drivers are likely not included if you aren't using Qemu.
These can be added by compiling your own kernel, either locally or
from another machine.

## Wired

Wired internet connection can be activated using 2 shell commands.
These can also be made a `svc` service (although this hasn't been
implemented yet). First, however, you must use `ip link` to find out
what your wired network interface is called:

```
[user@zandra ~]$ ip link
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0: <BROADCAST,MULTICAST> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether 00:00:00:00:00:00 brd ff:ff:ff:ff:ff:ff
[user@zandra ~]$
```

Now, you must turn the interface on and start a DHCP daemon.

```
[user@zandra ~]$ ip link set eth0 up
[user@zandra ~]$ sdhcp
```

## Wireless

Wireless internet connection can be activated using `wpa_supplicant` as well as `sdhcp`.

```
[user@zandra ~]$ ip link # find wireless interface name
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0: <BROADCAST,MULTICAST> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether 00:00:00:00:00:00 brd ff:ff:ff:ff:ff:ff
3: wlan0: <BROADCAST,MULTICAST> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether 00:00:00:00:00:00 brd ff:ff:ff:ff:ff:ff
[user@zandra ~]$ wpa_passphrase "Wireless SSID" "password" >> /etc/wpa_supplicant.conf # add network
[user@zandra ~]$ wpa_supplicant -B -i wlan0 -D nl80211 -c /etc/wpa_supplicant.conf # start wpa_supplicant
[user@zandra ~]$ sdhcp # start DHCP
```

Again, this can be automated.
