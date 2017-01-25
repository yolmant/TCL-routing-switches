#for this script we are using as ASL switches 3560
puts [ open flash:Lab4 w+ ] {

#VTP version 3 configuration
ios_config "vtp domain SWLAB" "vtp version 3" "vtp mode server"

#from here we will apply a serie of command that will compare the congence between the no edge port and the portfast
#debug to obser the convergence of using a no edge port
debug spanning-tree events
ios_config "interface g1/0/6" "switchport mode access" "switchport access vlan 120" "no shutdown"

#activate the portfast 
ios_config "interface g1/0/6" "spanning-tree portfast" "shutdown"

#BPDU implemented in a prot connected to a host
ios_config "interface g1/0/6" "spanning-tree bpduguard enable" "exit"
}
