puts [ open flash:Lab5-1 w+ ] {

#configuring EtherChannel as layer 2 PagP
ios_config "interface range g1/0/7-8" "switchport mode trunk" "switchport trunk allowed vlan all" "channel-group 3 mode desirable" "no shutdown" "exit"
