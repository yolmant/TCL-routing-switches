#this script will configure an EtherChannel load Balancing
puts [ open flash:EtherChannel w+ ] {

#load Balancing in port-channel
ios_config "port-channel load-balance src-dst-ip"
}
