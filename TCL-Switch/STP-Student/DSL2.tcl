puts [ open flash:Lab4 w+ ] {

#configure the trunk encapsulation in the ports 7 to 12. change the native VLAN 1 to VLAN 666. configure the interfaces to be trunk and unset the negotiation between ports
ios_config "interface range g1/0/7-12" "switchport trunk encapsulation dot1q" "switchpor trunk native vlan 666" "switchport mode trunk" "switchport nonegotiate" "no shutdown" "end"

#VTP version 3 configuration
ios_config "vtp domain SWLAB" "vtp version 3" "vtp mode server"

#configuring SPT primary for vlan 110,120 and secondary for vlan 99,100
ios_config "spanning-tree vlan 99,100 root primary" "spanning-tree vlan 110,120 root secondary" "exit"
}
