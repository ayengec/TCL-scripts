# ayengec TCL script examples: LOOPS

############## WHILE LOOP#############
set i 0
while "$i < 10" {
    set i [expr {$i + 1}]
    if {$i > 6} break
    puts "i=$i"
}
 # break: it's similar to C. If value greater than 6, loop will be interrupted
puts "Here is end of the while loop"
############### OUTPUT ###############
# i=1
# i=2
# i=3
# i=4
# i=5
# i=6
# Here is end of the while loop

######################################

############## FOR LOOP###############
# Be care to break one space while using for loop or others that you must use curly braces{}
# for loop logic is similar to C or other languages
# this example shows how to use nested loops
# incr operator = increment :)
for {set i 0} {$i <= 4} {incr i} {    
    for {set j 0} {$j <= 5} {incr j} {
        puts " Matrix indexes: M{$i}{$j}"
    }
}
############### OUTPUT ###############
# Matrix indexes: M{0}{0}
# Matrix indexes: M{0}{1}
# Matrix indexes: M{0}{2}
# Matrix indexes: M{0}{3}
# Matrix indexes: M{0}{4}
# Matrix indexes: M{0}{5}
# Matrix indexes: M{1}{0}
# Matrix indexes: M{1}{1}
# Matrix indexes: M{1}{2}
# Matrix indexes: M{1}{3}
# Matrix indexes: M{1}{4}
# Matrix indexes: M{1}{5}
# Matrix indexes: M{2}{0}
# Matrix indexes: M{2}{1}
# Matrix indexes: M{2}{2}
# Matrix indexes: M{2}{3}
# Matrix indexes: M{2}{4}
# Matrix indexes: M{2}{5}
# Matrix indexes: M{3}{0}
# Matrix indexes: M{3}{1}
# Matrix indexes: M{3}{2}
# Matrix indexes: M{3}{3}
# Matrix indexes: M{3}{4}
# Matrix indexes: M{3}{5}
# Matrix indexes: M{4}{0}
# Matrix indexes: M{4}{1}
# Matrix indexes: M{4}{2}
# Matrix indexes: M{4}{3}
# Matrix indexes: M{4}{4}
# Matrix indexes: M{4}{5}
######################################
