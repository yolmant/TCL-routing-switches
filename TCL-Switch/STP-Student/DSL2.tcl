puts [ open flash:Lab4 w+ ] {

#VTP version 3 configuration
ios_config "vtp domain SWLAB" "vtp version 3" "vtp mode server"

#configuring SPT primary for vlan 110,120 and secondary for vlan 99,100
ios_config "spanning-tree vlan 99,100 root primary" "spanning-tree vlan 110,120 root secondary" "exit"
}
