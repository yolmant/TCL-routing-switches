
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

#After tis point the switch would be able to connect wit the other switches
#The next step will configure our switch to work with VTP version 3. it could be avoid it if you want your network with version 2
ios_config "vtp version 3" 
vtp primary vlan 

#create new VLANs to demostate the function of VTP primary
ios_config "vlan 510" "name TEST510" "exit"
ios_config "vlan 511" "name TEST511" "exit"
ios_config "vlan 512" "name TEST512" "exit"
ios_config "vlan 513" "name TEST513" "exit"
ios_config "vlan 514" "name TEST514" "exit"
ios_config "vlan 515" "name TEST515" "exit"
ios_config "vlan 1500" "name TEST-EXT-1500" "exit"

#disable VLAN
ios_config "no vlan 510-514" "end"

}
