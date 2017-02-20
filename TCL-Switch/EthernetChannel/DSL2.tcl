#this will configure an etherchannel with cisco PAgP
puts [ open flash:EtherChannel w+ ] {

#port-channel as PAgp to misconfigure the network and observe what happen
ios_config "interface range g1/0/10-11" "shutdown" "channel-group 40 mode desirable" "no shutdown" "exit"

#fixing the configuration with port-channel 3 as LACP
ios_config "interface range g1/0/10-11" "shutdown" "no channel-group 40 mode desirable" "no shutdown" "exit"
ios_config "interface range g1/0/9-10" "shutdown" "channel-group 3 mode active" "no shutdown" "exit"
ios_config "interface range g1/0/11-12" "shutdown" "channel-group 12 mode on" "no shutdown" "exit"
ios_config "no interface port-channel 40" "exit"

#remember to reset the other ports-channel
