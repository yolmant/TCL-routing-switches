#for this script we are using as ASL switches 3560

puts [ open flash:Lab4 w+ ] {

#VTP version 3 configuration
ios_config "vtp domain SWLAB" "vtp version 3" "vtp mode server"

#change the cost on the port 12
ios_config "interface g1/0/7" "spanning-tree cost 12" "exit"

}
