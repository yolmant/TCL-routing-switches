puts [ open flash:Lab5-1 w+ ] {

#enabling routing and creating broadcast domaisn
ios_config "ip routing" "vlan 99" "name MGMT1" "exit"

#address the vlan
ios_config "interface vlan 99" "ip address 10.1.99.1 255.255.255.0" "no shutdown" "exit"

#address the interface loopback
ios_config "interface Lo1" "ip address 172.16.1.1 255.255.255.0" "no shutdown" "exit"
