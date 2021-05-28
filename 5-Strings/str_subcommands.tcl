# ayengec TCL scripts - Strings
set string "systemverilog, python and TCL scripts at ayengec repos"

puts "There are [string length $string] chars in \"$string\""
puts "[string index $string 1] is the second character in \"$string\""
puts "\"[string range $string 6 12]\" are between the 6. and 12. chars in my string"

# format is similar to Python and "%s %d" usages are similar to C
set lang_year [format "our company id support only %-20s %10d " "VHDL" "1993"]
puts "$lang_year"

set lower "systemverilog, python and tcl scripts"
set langs "X vhdl verilog tcl perl X"
set both  "___between underscores___"

puts "\n\n**************************** SUBCOMMANDS *****************************\n"

puts "toupper subcommand from: $lower to this: [string toupper $lower]\n"
puts "trim subcommand from: $both to this: [string trim $both "___"]\n"
puts "trimright subcommand from: $langs  to this: [string trimright $langs X]\n"
puts "trimleft subcommand from: $langs  to this: [string trimleft $langs X]\n"

############################## CONSOLE OUTPUTS ##################################
# There are 54 chars in "systemverilog, python and TCL scripts at ayengec repos"
# y is the second character in "systemverilog, python and TCL scripts at ayengec repos"
# "verilog" are between the 6. and 12. chars in my string
# our company id support only VHDL                       1993 


# **************************** SUBCOMMANDS *****************************

# toupper subcommand from: systemverilog, python and tcl scripts to this: SYSTEMVERILOG, PYTHON AND TCL SCRIPTS

# trim subcommand from: ___between underscores___ to this: between underscores

# trimright subcommand from: X vhdl verilog tcl perl X  to this: X vhdl verilog tcl perl 

# trimleft subcommand from: X vhdl verilog tcl perl X  to this:  vhdl verilog tcl perl X