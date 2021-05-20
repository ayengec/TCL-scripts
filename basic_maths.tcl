# ayengec TCL scripts examples

# How many digits will be shown as called precision
set tcl_precision 4;

puts "1/2 is [expr {1/2}]"

set x 300
set y 60
set pi 3.141592

# Use mathematical operation expressions within {}
set result [expr {$x/$y}]
puts "x/y is $result"

# we can use sin function similar to C
set ysin [expr {sin($y*$pi/180)}]
puts "sin($y) equals to $ysin"

# we can use sqrt function similar to C
set pwrVar [expr { sqrt($x-44) }]
puts "The sqrt($pwrVar) equals to $pwrVar"

# we can use round function similar to C
set rndVar 13.5567
puts "Rounded $rndVar equals to [expr {round($rndVar)}]"

# If else statement is similar to C "expr condition? TRUE_SIDE : FALSE_SIDE" 
set condVar 12
puts "While variable=$condVar, the result of if-else condition [expr { $condVar<10? sqrt($condVar) : pow($condVar, 2) } ]"

set condVar 196
puts "While variable=$condVar, the result of if-else condition [expr { $condVar>10? sqrt($condVar) : pow($condVar, 2) } ]"

############################## OUTPUTS #################################################
# 1/2 is 0
# x/y is 5
# sin(60) equals to 0.866
# The sqrt(16.0) equals to 16.0
# Rounded 13.5567 equals to 14
# While variable=12, the result of if-else condition 144.0
# While variable=196, the result of if-else condition 14.0
########################################################################################
