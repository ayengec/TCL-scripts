  
# ayengec TCL script examples: proc
# proc (procedur) is similar to "function" "def" defines in other languages.
# it gets input argumants and returns output value that processed.

proc divider {val div} {
    if { $div == 0 } {
        puts "You cannot give div=0 Try again."
        return "ZERO DIVISION ERROR! ENDLESS"
    } else {
    set y [expr {$val/$div}];
    return $y
    }
}
# second example [divider 120 24]
set result [divider 2 0]
puts "The result = $result"

################### OUTPUT #######################
# You cannot give div=0 Try again.
# The result = ZERO DIVISION ERROR! ENDLESS

############ While [divider 120 24] OUTPUT #######
# The result = 5
##################################################


