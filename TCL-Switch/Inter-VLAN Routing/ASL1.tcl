puts [ open flash:Lab5-1 w+ ] {

#configuring etherchannel links as layer 2 PagP
ios_config "interface range g1/0/7-8" "switchport mode trunk" "switchport trunk allowed vlan except 110" "channel-group 1 mode desirable" "no shutdown" "exit"
ios_config "interface range g1/0/9-10" "switchport mode trunk" "switchport trunk allowed vlan 110" "channel-group 4 mode desirable" "no shutdown" "exit"

##enabling layer 3 connectivity across the network
#creating and configuring new vlan
ios_config "vlan 99" "name MGMT1" "exit" "interface vlan 99" "ip address 10.1.99.2 255.255.255.0" "no shutdown" "exit"

#assigning a default-gateway
ios_config "ip default-gateway 10.1.99.1"

#enabling routing and creating and configuring vlan
ios_config "ip routing" "vlan 100" "name LOCAL" "exit" "vlan 110" "name INTERNODE" "exit"
ios_config "interface vlan 100" "ip address 10.1.100.1 255.255.255.0" "no shutdown" "exit"
ios_config "interface vlan 110" "ip address 10.1.110.2 255.255.255.0" "no shutdown" "exit"

#assigning a interface to a host
ios_config "interface g1/0/6" "switchport host" "switchport access vlan 100" "no shutdown" "exit"

#configuring static routes accross the nerwork
ios_config "ip route 192.168.1.0 255.255.255.0 vlan 110"
ios_config "ip route 0.0.0.0 0.0.0.0 10.1.99.1"
}
