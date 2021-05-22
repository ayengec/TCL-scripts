puts "******* ayengec TCL example: assigning variables and printing *******"
# set variableName(any type) Value_of_variable
set strVar "The value of double variable is"
set dblVar 1.24
set intVar 10

puts "$strVar $dblVar \tthe integer variable equals to $intVar. \nHere is new line"    
# \n and \t usages: new line and tab usage are similar to C/C++ 
# with $ and the variable name means the value of that variable

# if you don't use any variable in puts expression, you can also use between {}. But whole chars will be printed as you see below.
puts {$strVar $dblVar \tthe integer variable equals to $intVar. \nHere is new line}

set dblVar [set intVar 55]
puts "new intVar = $intVar and nested dblVar = $dblVar"

###################### OUTPUTS #############################################
# ******* ayengec TCL example: assigning variables and printing *******
# The value of double variable is 1.24 	the integer variable equals to 10. 
# Here is new line
# $strVar $dblVar \tthe integer variable equals to $intVar. \nHere is new line
# new intVar = 55 and nested dblVar = 55
###########################################################################
