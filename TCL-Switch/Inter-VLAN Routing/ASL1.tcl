puts [ open flash:Lab5-1 w+ ] {

#configuring etherchannel links as layer 2 PagP
ios_config "interface range g1/0/7-8" "switchport mode trunk" "switchport trunk allowed vlan except 110" "channel-group 1 mode desirable" "no shutdown" "exit"
ios_config "interface range g1/0/9-10" "switchport mode trunk" "switchport trunk allowed vlan 110" "channel-group 4 mode desirable" "no shutdown" "exit"
