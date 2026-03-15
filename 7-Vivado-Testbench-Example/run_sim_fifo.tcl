# ----------------------------------------
# Dual-Port FIFO Comprehensive Test
# Automates multiple testcases and logs results
# ----------------------------------------

# -------------------------
# Configuration
# -------------------------
set rtl_dir "../src"
set tb_dir "../tb"
set tb_name "tb_dual_port_fifo"
set log_dir "./logs"

# Create log directory
file mkdir $log_dir

# -------------------------
# Compile RTL and TB
# -------------------------
puts "INFO: Compiling RTL and Testbench..."
xvlog "$rtl_dir/dual_port_fifo.sv"
xvlog "$tb_dir/$tb_name.sv"

# Elaborate
puts "INFO: Elaborating design..."
xelab $tb_name -s sim_$tb_name

# -------------------------
# Define test cases
# -------------------------
# Each test case is a dict: name, write_pattern, read_pattern
set testcases [list \
    [dict create name "Write 0-15"          write_pattern {0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15} read_pattern {0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15}] \
    [dict create name "Random Write/Read"   write_pattern {5 2 7 9 1 3} read_pattern {5 2 7 9 1 3}] \
    [dict create name "Full FIFO check"     write_pattern {0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15} read_pattern {0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15}] \
]

# -------------------------
# Run each testcase
# -------------------------
foreach tc $testcases {
    set tc_name [dict get $tc name]
    set write_pat [dict get $tc write_pattern]
    set read_pat  [dict get $tc read_pattern]

    puts "-------------------------------------------------------"
    puts "Running Testcase: $tc_name"
    puts "-------------------------------------------------------"

    # Open log file for this testcase
    set log_file [open "$log_dir/${tc_name}_log.txt" w]

    # Reset DUT
    force /tb_dual_port_fifo/rst 1 0
    run 20ns
    force /tb_dual_port_fifo/rst 0 0
    run 10ns
    puts $log_file "INFO: Reset done"

    # -------------------------
    # Write phase
    # -------------------------
    puts $log_file "INFO: Starting Write Phase"
    foreach val $write_pat {
        force /tb_dual_port_fifo/din $val 0
        force /tb_dual_port_fifo/wr_en 1 0
        run 10ns
        force /tb_dual_port_fifo/wr_en 0 0
        run 10ns
        puts $log_file "WRITE: $val"
    }

    # -------------------------
    # Read phase
    # -------------------------
    puts $log_file "INFO: Starting Read Phase"
    foreach expected $read_pat {
        force /tb_dual_port_fifo/rd_en 1 0
        run 10ns
        force /tb_dual_port_fifo/rd_en 0 0
        run 10ns

        # Read actual value from DUT
        set actual_val [get_property VALUE /tb_dual_port_fifo/dout]
        puts $log_file "READ: expected=$expected, actual=$actual_val"

        # Check correctness
        if {$actual_val != $expected} {
            puts $log_file "ERROR: Mismatch! expected=$expected actual=$actual_val"
        }
    }

    puts $log_file "INFO: Testcase '$tc_name' completed"
    close $log_file
}

puts "-------------------------------------------------------"
puts "ALL TESTCASES COMPLETED"
puts "Check logs in $log_dir"
puts "-------------------------------------------------------"

quit
