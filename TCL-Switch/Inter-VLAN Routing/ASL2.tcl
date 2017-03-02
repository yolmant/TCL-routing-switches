puts [ open flash:Lab5-1 w+ ] {

#configuring EtherChannel as layer 2 PagP
ios_config "interface range g1/0/7-8" "switchport mode trunk" "switchport trunk allowed vlan all" "channel-group 3 mode desirable" "no shutdown" "exit"

#enabling layer 3 connectivity across the network
#creating and configuring new vlan
ios_config "vlan 120" "name MGMT2" "exit" "interface vlan 120" "ip address 10.1.120.2 255.255.255.0" "no shutdown" "exit" 

#assigning a default-gateway
ios_config "ip default-gateway 10.1.120.1"
