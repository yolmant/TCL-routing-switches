#this shell script will configure EtherChannel PAgP and LACP
puts [ open flash:EtherChannel w+ ] {

#port-channel 1 as PAgP
ios_config "interface range g1/0/11-12" "shutdown" "channel-group 1 mode desirable" "no shutdown" "exit"

#port-channel 2 as LACP
ios_config "interface range g1/0/7-8" "shutdown" "channel-group 2 mode active" "no shutdown" "exit"

#creating port-channels to misconfigure the network
ios_config "interface range g1/0/9-10" "shutdown" "channel-group 3 mode active" "no shutdown" "exit"

#configure load-balancing
ios_config "port-channel load-balance src-dst-ip"
}
