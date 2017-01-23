#this script will successfully work in switches 3560. 
#for other switches like 2960 substitute the command "sdm prefer dual-ipv4-and-ipv6 routing" to "lanbase-routing"

puts [ open flash:Reset.tcl w+ ] {
typeahead "\n"
copy running-config startup-config
typeahead "\n"
erase startup-config
delete /force vlan.dat
delete /force multiple-fs
ios_config "sdm prefer dual-ipv4-and-ipv6 routing"
typeahead "\n"
puts "Switch in 1 minute. please relax."
reload in 1 RESET.TCL SCRIPT RUN
}
