puts [ open flash:Lab4 w+ ] {

#VTP version 3 configuration.
ios_config "vtp domain SWLAB" "vtp version 3" "vtp mode server" "exit"
vtp primary vlan

#configure the trunk encapsulation in the ports 7 to 12. change the native VLAN 1 to VLAN 666. configure the interfaces to be trunk and unset the negotiation between ports
ios_config "interface range g1/0/7-12" "switchport trunk encapsulation dot1q" "switchpor trunk native vlan 666" "switchport mode trunk" "switchport nonegotiate" "no shutdown" "end"

#VLAN configuration that will be required fo the network
ios_config "vlan 99" "name MANAGEMENT" "vlan 100" "name SERVERS" "vlan 110" "name GUEST" "vlan 120" "name OFFICE" "exit"

#configuration of the VLAN that wil suspend the ports unused and name the native VLAN
ios_config "vlan 999" "name PARKING_LOT" "state suspend" "vlan 666" "name NATIVE_DO_NOT_USE" "exit"

#configuring SPT primary for vlan 99,100 and secondary for vlan 110,120
ios_config "spanning-tree vlan 99,100 root primary" "spanning-tree vlan 110,120 root secondary" "exit"

#implementing Root Guard
ios_config "interface g1/0/7" "spanning-tree guard root" "exit"

}
