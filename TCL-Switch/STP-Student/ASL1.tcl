puts [ open flash:Lab3-1 w+ ] {

#VTP version 3 configuration
ios_config "vtp domain SWLAB" "vtp version 3" "vtp mode server"
}
