# Vivado Automated Build Flow Example by using TCL

This repository demonstrates a **fully automated FPGA build flow using Vivado**.

Instead of creating a traditional `.xpr` Vivado project, the entire **RTL → Bitstream** process is controlled by a single **Tcl script (`build.tcl`)**.  

This approach is widely used in **professional FPGA development** because it integrates cleanly with automated hardware builds

---

# Project Structure

Make sure your repository follows this structure:

```
.
├── src/                # Verilog source files
├── constraints/        # FPGA constraint files (.xdc)
├── build.tcl           # Vivado automation script
└── README.md
```

### Folder Description

| Folder/File | Description |
|---|---|
| `src/` | Contains all Verilog RTL files (`.v`) |
| `constraints/` | FPGA constraint files (`.xdc`) |
| `build.tcl` | The full automated Vivado build script |
| `README.md` | Project documentation |

The script automatically loads all files using:

```
glob ./src/*.v
glob ./src/*.sv
glob ./constraints/*.xdc
```

---

# Script Configuration

Inside `build.tcl`, several variables define the build configuration:

```
set outputDir ./build_output
set partName  xc7a35tcpg236-1
set topModule top_module
```

| Variable | Description |
|---|---|
| `outputDir` | Folder where all build artifacts are generated |
| `partName` | Target FPGA device |
| `topModule` | Name of the top-level HDL module |

Example FPGA part:

```
xc7a35tcpg236-1
```

(This corresponds to boards like **Basys 3**.)

---

# How to Run

Run the build from a terminal:

```bash
vivado -mode batch -source build.tcl
```

### Command Explanation

| Option | Description |
|---|---|
| `-mode batch` | Runs Vivado without launching the GUI |
| `-source build.tcl` | Executes the Tcl script automatically |

The entire process runs **headless** and prints logs to the terminal.

---

# Build Flow

The script performs the following FPGA implementation steps:

```
RTL Sources
     ↓
Synthesis
     ↓
Optimization
     ↓
Placement
     ↓
Physical Optimization
     ↓
Routing
     ↓
Bitstream Generation
```

Each stage is executed sequentially inside the script.

---

# Build Outputs

After completion, a folder called:

```
build_output/
```

will be generated.

| Type | File | Description |
|---|---|---|
| Checkpoint | `post_synth.dcp` | Design snapshot after synthesis |
| Checkpoint | `post_place.dcp` | Snapshot after placement |
| Checkpoint | `post_route.dcp` | Snapshot after routing |
| Report | `post_route_timing.rpt` | Timing summary (check WNS/TNS) |
| Report | `post_route_util.rpt` | Resource utilization |
| Report | `post_route_power.rpt` | Estimated power usage |
| Bitstream | `final_design.bit` | FPGA programming file |

---

### Reproducible Builds

Anyone can reproduce the same build using a single command.

---

# Possible Troubleshooting

### Build Fails

Check:

```
vivado.log
```

Common issues:

- Missing Verilog file
- Incorrect constraint file
- Syntax error in RTL

---

### Top Module Not Found

Make sure the variable in `build.tcl` matches your RTL:

```
set topModule top_module
```

---

### FPGA Part Mismatch

Verify the device:

```
set partName xc7a35tcpg236-1
```

---
