#this script will configure an EtherChannel with IEEE 802.1X
puts [ open flash:EtherCha w+ ] {

#port-channel as LACP
ios_config "interface range g1/0/7-8" "shurdown" "channel-group 2 mode active" "no shutdown" "end"

#configure port-channel 12
ios_config "interface range g1/0/11-12" "shutdown" "channel-group 12 mode on" "no shutdown" "exit"
