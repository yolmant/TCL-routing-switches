puts [ open flash:Lab5-1 w+ ] {

#enabling routing and creating broadcast domaisn
ios_config "ip routing" "vlan 99" "name MGMT1" "exit"

#address the vlan
ios_config "interface vlan 99" "ip address 10.1.99.1 255.255.255.0" "no shutdown" "exit"

#address the interface loopback
ios_config "interface Lo1" "ip address 172.16.1.1 255.255.255.0" "no shutdown" "exit"

#convert the link with DSL2 to layer 3
ios_config "interface range g1/0/11-12" "no switchport" "channel-group 2 mode desirable" "no shutdown" "exit"
ios_config "interface port-channel 2" "ip address 176.16.12.1 255.255.255.252" "no shutdown" "exit"

#configuring a static default route
ios_config "ip route 0.0.0.0 0.0.0.0 port-channel 2 172.16.12.2"
