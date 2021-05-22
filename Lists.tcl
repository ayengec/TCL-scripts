# ayengec TCL examples: List Data Type and its methods

set langList "SV VHDL Verilog TCL SystemC"
puts "The length of the language list : [llength $langList]\n"

# "lappend" adds the new element at the end of the list, similarly other languages
lappend langList "Python"

puts "Second index of langList = [lindex $langList 2]\n"

# "foreach" is similar to other languages. It provides to iterate whole elements in any list or etc.
foreach element $langList {
    puts "Iteratively elements in langList: $element"
}

# "split" is also similar to other languages especially same with Python
set csvParseList [split 136,2300,1234,554,688 ","]
puts "\n.csv values are splitted as {$csvParseList}\n"

foreach element $csvParseList {
    puts "Iteratively elements in csvParseList: $element"
}

################### OUTPUTS ###########################
# The length of the language list : 5
# 
# Second index of langList = Verilog
# 
# Iteratively elements in langList: SV
# Iteratively elements in langList: VHDL
# Iteratively elements in langList: Verilog
# Iteratively elements in langList: TCL
# Iteratively elements in langList: SystemC
# Iteratively elements in langList: Python
# 
# .csv values are splitted as {136 2300 1234 554 688}
# 
# Iteratively elements in csvParseList: 136
# Iteratively elements in csvParseList: 2300
# Iteratively elements in csvParseList: 1234
# Iteratively elements in csvParseList: 554
# Iteratively elements in csvParseList: 688
#######################################################
