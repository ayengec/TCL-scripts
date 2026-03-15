# ---------------------------------------------------------------------------
# Vivado Non-Project Mode Automated Build Script
# Professional FPGA Build Flow
# Created by: Alican Yengec
# ---------------------------------------------------------------------------

puts "-------------------------------------------------------"
puts " Vivado Automated RTL -> Bitstream Build Flow Starting "
puts "-------------------------------------------------------"

# ---------------------------------------------------------------------------
# 1. Configuration
# ---------------------------------------------------------------------------

set outputDir "./build_output"
set srcDir "./src"
set constrDir "./constraints"

set partName  "xc7a35tcpg236-1"
set topModule "top_module"

# Create output directory
file mkdir $outputDir

puts "INFO: Target FPGA Part : $partName"
puts "INFO: Top Module       : $topModule"
puts "INFO: Output Directory : $outputDir"

# ---------------------------------------------------------------------------
# 2. Read Source Files
# ---------------------------------------------------------------------------

puts "INFO: Reading Verilog sources..."

foreach file [glob -nocomplain $srcDir/*.v] {
    puts "  -> $file"
    read_verilog $file
}

puts "INFO: Reading SystemVerilog sources..."

foreach file [glob -nocomplain $srcDir/*.sv] {
    puts "  -> $file"
    read_verilog -sv $file
}

puts "INFO: Reading Constraint files..."

foreach file [glob -nocomplain $constrDir/*.xdc] {
    puts "  -> $file"
    read_xdc $file
}

# ---------------------------------------------------------------------------
# 3. Synthesis
# ---------------------------------------------------------------------------

puts "-------------------------------------------------------"
puts "Starting Synthesis"
puts "-------------------------------------------------------"

synth_design -top $topModule -part $partName

write_checkpoint -force $outputDir/post_synth.dcp

# ---------------------------------------------------------------------------
# 4. Implementation
# ---------------------------------------------------------------------------

puts "-------------------------------------------------------"
puts "Starting Logic Optimization"
puts "-------------------------------------------------------"

opt_design

puts "-------------------------------------------------------"
puts "Starting Placement"
puts "-------------------------------------------------------"

place_design
phys_opt_design

write_checkpoint -force $outputDir/post_place.dcp

puts "-------------------------------------------------------"
puts "Starting Routing"
puts "-------------------------------------------------------"

route_design

write_checkpoint -force $outputDir/post_route.dcp

# ---------------------------------------------------------------------------
# 5. Reports (QoR)
# ---------------------------------------------------------------------------

puts "-------------------------------------------------------"
puts "Generating Reports"
puts "-------------------------------------------------------"

report_timing_summary -file $outputDir/post_route_timing.rpt
report_utilization    -file $outputDir/post_route_util.rpt
report_power          -file $outputDir/post_route_power.rpt

# ---------------------------------------------------------------------------
# 6. Timing Check (Fail build if timing violated)
# ---------------------------------------------------------------------------

set timing_report [report_timing_summary -return_string]

if {[regexp {WNS.*-} $timing_report]} {
    puts "-------------------------------------------------------"
    puts "ERROR: Timing violation detected (Negative Slack)"
    puts "Check post_route_timing.rpt"
    puts "-------------------------------------------------------"
    exit 1
}

puts "INFO: Timing Check Passed"

# ---------------------------------------------------------------------------
# 7. Bitstream Generation
# ---------------------------------------------------------------------------

puts "-------------------------------------------------------"
puts "Generating Bitstream"
puts "-------------------------------------------------------"

write_bitstream -force $outputDir/final_design.bit

puts "-------------------------------------------------------"
puts " BUILD SUCCESSFUL "
puts " Bitstream generated at:"
puts " $outputDir/final_design.bit"
puts "-------------------------------------------------------"

exit
