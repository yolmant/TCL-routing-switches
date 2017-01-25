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

#to observe the manipulation of the root port we shutdown the next ports
ios_config "interface range g1/0/9-10" "shutdown" "exit"

#change the port priority to make the interface 8 as root port
ios_config "interface f0/8" "spanning-tree port-priority 112" "exit"

#form this part of the script you will compare the time of convergece between PVST and RPVST
#this commands will show you ho long the switch converge when you shut down interfaces (observe the convergence of PVST
debug span eve
ios_config "interface g1/0/11" "shutdown" "exit"

#configuration of RPVST and clean any information of PVST
ios_config "spanning-tree mode rapid-pvst"
clear spanning-tree mode detected-protocols

#debuging to observer convergence
debug spanning-tree events
ios-config "interface g1/0/11" "no shutdown" "exit"

#implementing Root Guard
ios_config "interface g1/0/7" "spanning-tree guard root" "exit"

#After observe the changes. remove the previously commmand to clean the switch as we had before
ios_config "interface g1/0/7" "no spanning-tree guard root" "exit"
}
