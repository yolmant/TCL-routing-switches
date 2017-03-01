puts [ open flash:Lab5-1 w+ ] {

#enabling routing and creating broadcast domains
ios_config "ip routing" "vlan 110" "name INTERNODE" "exit" "vlan 120" "name MGMT2" "exit"

#adress the Vlans and interface loopback
ios_config "interface vlan 110" "ip address 10.1.110.1 255.255.255.0" "no shutdown" "exit"
ios_config "interface vlan 120" "ip address 10.1.120.1 255.255.255.0" "no shutdown" "exit"
ios_config "interface lo1" "ip address 192.168.1.1 255.255.255.0" "no shutdown" "exit"

#assigning interface to a host
ios_config "interface g1/0/6" "switchport host" "switchport access vlan 110" "no shutdown "exit"

#convert the link with DSL1 to layer 3
ios_config "interface range g1/0/11-12" "no switchport" "channel-group 2 mode desirable" "no shutdown" "exit"
ios_config "interface port-channel 2" "ip address 172.16.12.2 255.255.255.252" "no shutdown "exit"

#configuring a static default route
ios_config "ip route 0.0.0.0 0.0.0.0 port-channel 2 172.16.12.1
