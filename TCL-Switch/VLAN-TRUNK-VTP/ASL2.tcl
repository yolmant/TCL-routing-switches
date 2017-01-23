puts [ open flash:Lab3-1 w+ ] {

#VTP version 3 configuration
ios_config "vtp domain SWLAB" "vtp version 3" "vtp mode server" "vtp password cisco123"

#configure the trunk encapsulation in the ports 7 to 12. change the native VLAN 1 to VLAN 666. configure the interfaces to be trunk and unset the negotiation between ports
ios_config "interface range f0/7-12" "switchport trunk native vlan 666" "switchport mode trunk" "switchport nonegotiate" "switchport trunk allowed vlan except 1,999" "no shutdown" "exit"

#Place all the ports that are not used to the VLAN 999
ios_config "interface range f0/1-5, f0/13-24, g0/1-2" "switchport mode access" "switchport nonegotiate" "switchport access vlan 999" "shutdown" "exit"

}
