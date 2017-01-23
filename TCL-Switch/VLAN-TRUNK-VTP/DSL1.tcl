puts [ open flash:Lab3-1 w+ ] {

#configuration of Management VLAN
ios_config "interface vlan 99" "ip address 10.1.99.101 255.255.255.0" "no shutdown" "exit"

#VTP version 2 configuration
ios_config "vtp domain SWLAB" "vtp version 2" "vtp mode server" "vtp password cisco123" "exit"

#VLAN configuration that will be required fo the network
ios_config "vlan 99" "name MANAGEMENT" "vlan 100" "name SERVERS" "vlan 110" "name GUEST" "vlan 120" "name OFFICE" "exit"

#configuration of the VLAN that wil suspend the ports unused and name the native VLAN
ios_config "vlan 999" "name PARKING_LOT" "state suspend" "vlan 666" "name NATIVE_DO_NOT_USE" "exit"

#configure the trunk encapsulation in the ports 7 to 12. change the native VLAN 1 to VLAN 666. configure the interfaces to be trunk and unset the negotiation between ports
ios_config "interface range g1/0/7-12" "switchport trunk encapsulation dot1q" "switchpor trunk native vlan 666" "switchport mode trunk" "switchport nonegotiate" "no shutdown" "end"

#disallowing VLAN 1 & 999
ios_config "interface range g1/0/7-12" "switchport trunk allowed vlan except 1,999"

#Place all the ports that are not used to the VLAN 999
ios_config "interface range g1/0/1-5, g1/0/13-24, g1/1/1-2" "switchport mode access" "switchport nonegotiate" "switchport access vlan 999" "shutdown" "exit"
