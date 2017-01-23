puts [ open flash:Lab3-1 w+ ] {

#VTP configuration and disallowing the VLANs 1 and 999
ios_config "vtp mode client" "interface range f0/7-12" "switport trunk native vlan 666" "switchport mode trunk" "switchport nonegotiate" "switchport trunk allowed execpt 1,999" "no shutdown" "exit"

#configuring a VTP domain and password
ios_config "vtp domain SWLAB" "vtp password cisco123" "end"

#Place all the ports that are not used in VLAN 999
ios_config "interface range f0/1-5, f0/13-24, g0/1-2" "switchport mode access" "switchport nonegotiate" "switchport access vlan 999" "shutdown" "exit"
