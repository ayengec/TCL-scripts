set lang "SV"
set meth "UVM"

#only one space between the word1 and word2 "} {"
if { $lang == "SV" } {
    puts "Welcome. Systemverilog is completely supported. Create your project."
    if {$meth == "UVM"} {
        puts "Yes. UVM is supported."
    } else {
        puts "URM or OVM is not completely supported!"
    }
} elseif { $lang == "VHDL"} {
    puts "VHDL is supported with limitations."
} else {
    puts "Other languages are not supported by this tool."
}
# Here is so critical. You have to break one space between { or } and expressions; no Enter, Tab, newline etc...
# Be care there should be one spcae every { and else/elseif/if statements

##################### OUTPUTS ###############################################
# Welcome. Systemverilog is completely supported. Create your project.
# Yes. UVM is supported.
