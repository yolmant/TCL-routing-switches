puts [ open flash:Lab3 w+ ] {

#VTP version 3 configuration
ios_config "vtp domain SWLAB" "vtp version 3" "vtp mode server" "vtp password cisco123"

#configure the trunk encapsulation in the ports 7 to 12. change the native VLAN 1 to VLAN 666. configure the interfaces to be trunk and unset the negotiation between ports
ios_config "interface range g1/0/7-12" "switchport trunk native vlan 666" "switchport trunk encapsulation dot1q" "switchport mode trunk" "switchport nonegotiate" "switchport trunk allowed vlan except 1,999" "no shutdown" "exit"
}
