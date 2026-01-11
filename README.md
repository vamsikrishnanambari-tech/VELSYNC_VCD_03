# VELSYNC_VCD_03
This project implements a digital stopwatch using Verilog HDL. It supports start/stop toggle and reset operations and counts seconds from 0 to 59. A parameterized clock divider generates a 1 Hz pulse from the system clock. The design is fully synchronous, synthesizable, and verified using a testbench..

# ✨ Features

* Start / Stop toggle control

* Reset functionality

* Seconds counter (0–59)

* Parameterized clock divider (1 Hz generation)

* Pure Verilog-2001 (no vendor-specific code)

* Compatible with ModelSim, Icarus Verilog, Vivado

# 🧠 Design Description

* A clock divider converts the system clock into a 1 Hz pulse.

* A toggle flip-flop controls the running state.

* A binary counter increments seconds when running.

* Counter rolls over from 59 → 0.

* Active-low asynchronous reset initializes the system.

# 📁 File Structure
* 📦 Digital-Stopwatch-Verilog
* ┣ 📜 stopwatch.v     # RTL design
* ┣ 📜 DCS_tb.v        # Testbench
* ┗ 📜 README.md       # Project documentation

# ▶️ Simulation Instructions (ModelSim)
* vlib work
* vmap work work
* vlog stopwatch.v
* vlog DCS_tb.v
* vsim DCS_tb
* run -all

# 📊 Observed Signals

* clk – system clock

* rst_n – active-low reset

* start_stop – control input

* running – stopwatch state

* tick_1hz – one-second pulse

* seconds[6:0] – elapsed seconds

# 🛠️ Tools Used

* Verilog HDL

* ModelSim / QuestaSim

* Icarus Verilog (optional)
