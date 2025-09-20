# Digital Systems Electronics Laboratory Projects

[![FPGA](https://img.shields.io/badge/Platform-FPGA-blue)](https://github.com/yourusername/digital-systems-labs)
[![VHDL](https://img.shields.io/badge/Language-VHDL-green)](https://github.com/yourusername/digital-systems-labs)
[![ModelSim](https://img.shields.io/badge/Simulation-ModelSim-orange)](https://github.com/yourusername/digital-systems-labs)
[![Quartus](https://img.shields.io/badge/Synthesis-Quartus_Prime-red)](https://github.com/yourusername/digital-systems-labs)

## Overview

This repository contains a comprehensive collection of digital design projects implemented in VHDL for FPGA development. The projects progress from basic combinational circuits to complex sequential systems, providing hands-on experience with digital system design, simulation, and synthesis.

**Target Platform**: Altera DE1-SoC Board (Cyclone V FPGA)  
**Development Tools**: Intel Quartus Prime, ModelSim  
**Hardware Description Language**: VHDL

## Laboratory Projects

### 🔧 LAB 1: Multiplexers, LEDs, and Switches
**Focus**: Basic I/O interfacing and combinational logic

- **Part 1**: LED control using switches
- **Part 2**: 4-bit wide 2-to-1 multiplexer implementation
- **Part 3**: 3-bit wide 5-to-1 multiplexer using hierarchical design
- **Part 4**: Comprehensive testbench development

**Key Concepts**: Basic VHDL syntax, multiplexer design, testbench methodology, pin assignment

📄 **Lab Report**: [LAB1_Report.pdf](https://drive.google.com/file/d/1RZsyXG_u_8ypSYZqoLYN_xLsh8nDcR5F/view?usp=drive_link)

---

### 🖥️ LAB 2: Decoders, Numbers, and 7-Segment Displays
**Focus**: Display systems and number representation

- **Part 1**: 7-segment display decoder with character mapping
- **Part 2**: Multiplexed 7-segment display with rotating text
- **Part 3**: Binary-to-decimal converter with overflow detection
- **Part 4**: Binary-to-BCD converter for extended range

**Key Concepts**: 7-segment display control, character encoding, number system conversion, hierarchical design

📄 **Lab Report**: [LAB2_Report.pdf](https://drive.google.com/file/d/1BYHBdhyYk_49TOgBm4uV5rwizGMUMwVe/view?usp=drive_link)

---

### ⚡ LAB 3: Data-Path Elements
**Focus**: Arithmetic circuits and performance optimization

- **Part 1**: 4-bit sequential ripple carry adder (RCA) with overflow detection
- **Part 2**: 4-bit adder/subtractor with signed arithmetic
- **Part 3**: 16-bit adder implementations:
  - Ripple Carry Adder (RCA)
  - Carry-Bypass Adder (CBA)
  - Carry-Select Adder (CSA)
- **Part 4**: 4×4-bit array multiplier implementation

**Key Concepts**: Arithmetic circuits, carry propagation, timing analysis, performance optimization

📄 **Lab Report**: [LAB3_Report.pdf](https://drive.google.com/file/d/1GEH64J_BgRboAMm___l0NUw6eWbIFc5i/view?usp=drive_link)

---

### 🔄 LAB 4: Flip-Flops and Counters
**Focus**: Sequential circuit design and timing

- **Part 1**: Gated SR latch implementation using primitive gates
- **Part 2**: 16-bit synchronous counter (structural implementation)
- **Part 3**: 16-bit synchronous counter (behavioral implementation)
- **Part 4**: Real-time digit display system (0-9 flashing counter)
- **Part 5**: Reaction timer with millisecond precision

**Key Concepts**: Sequential logic, flip-flop design, counter architectures, real-time systems

📄 **Lab Report**: [LAB4_Report.pdf](https://drive.google.com/file/d/1wlT6NvvXcb72r2pwPTW3I868AVZSVIRz/view?usp=drive_link)

---

### 🏗️ LAB 5: Finite State Machines (FSMs)
**Focus**: Control unit design and state machine implementation

- **Part 1**: One-hot FSM for sequence detection (four consecutive 1s or 0s)
- **Part 2**: Modified one-hot encoding with reset optimization
- **Part 3**: Two-process FSM implementation methodology
- **Part 4**: "HELLO" ticker-tape display system with FSM control

**Key Concepts**: State machine design, encoding strategies, control unit architecture, FSM optimization

📄 **Lab Report**: [LAB5_Report.pdf](https://drive.google.com/file/d/1cOO3k1I-0nwqGNIjU25LSEQHPl3GmWd3/view?usp=drive_link)

---

### 🎛️ LAB 6: Digital Filter Implementation
**Focus**: Complex system integration and signal processing

**Project**: Real-time digital filter implementation
- Memory-based signal processing system
- Multiplierless datapath design (shift-and-add operations)
- Saturation arithmetic for fixed-point representation
- Complete system integration with control unit and datapath

**Filter Specification**:
```
Y(n) = -0.5X(n) - 2X(n-1) + 4X(n-2) + 0.25X(n-3)
```

**Key Concepts**: Digital signal processing, memory interface design, algorithmic state machines, system integration

📄 **Lab Report**: [LAB6_Report.pdf](https://drive.google.com/file/d/16dUFIS1DhpCEwVmCOmMeOIieD1cpl-OZ/view?usp=drive_link)

## Repository Structure

```
digital-systems-labs/
├── LAB 1/                  # Basic I/O and Multiplexers
│   └── VHDL FILES/
│       ├── Part1/          # LED control
│       ├── Part 2/         # 2-to-1 MUX
│       └── PART 3/         # 5-to-1 MUX
├── LAB 2/                  # Decoders and Displays
│   ├── part1/              # 7-segment decoder
│   ├── part2/              # Multiplexed display
│   ├── Part3/              # Binary-to-decimal
│   └── part4/              # Binary-to-BCD
├── LAB 3/                  # Arithmetic Circuits
│   ├── part1_2/            # RCA and Adder/Subtractor
│   ├── part3/              # Advanced adders
│   └── PART4/              # Array multiplier
├── LAB 4/                  # Sequential Circuits
│   ├── PART 1/             # SR latch
│   ├── PART 2/             # Structural counter
│   ├── PART 3/             # Behavioral counter
│   └── part4/              # Real-time applications
├── LAB 5/                  # Finite State Machines
│   ├── Part 1/             # One-hot FSM
│   ├── Part 2/             # Modified encoding
│   ├── Part 3/             # Two-process FSM
│   └── Part 4/             # Ticker-tape system
└── LAB 6/                  # Digital Filter
    ├── datapath/           # Arithmetic components
    ├── 1KB memory/         # Memory modules
    └── complete/           # Integrated system
```

## Getting Started

### Prerequisites
- Intel Quartus Prime (version 16.1 or later)
- ModelSim (Intel FPGA Edition recommended)
- Altera DE1-SoC development board
- Basic knowledge of digital logic and VHDL

### Installation & Setup
1. Clone this repository:
   ```bash
   git clone https://github.com/Dustmamat/digital_design.git
   cd digital-systems-labs
   ```

2. Install development tools:
   - Download and install Intel Quartus Prime Lite Edition
   - Ensure ModelSim is included in the installation

3. Hardware setup:
   - Connect the DE1-SoC board via USB
   - Install USB-Blaster drivers if prompted

### Running a Project

#### Simulation with ModelSim
1. Navigate to the desired lab directory
2. Open ModelSim and create a new project
3. Add VHDL files to the project:
   ```tcl
   vlib work
   vcom *.vhd
   vsim entity_name
   ```
4. Run the testbench and analyze waveforms

#### Synthesis with Quartus Prime
1. Create a new Quartus Prime project
2. Import VHDL source files
3. Set target device: **Cyclone V 5CSEMA5F31C6**
4. Import pin assignments from `DE1_SoC.qsf`
5. Compile the design
6. Program the FPGA using the Programmer tool

## Project Highlights

### Advanced Features Implemented
- **Timing Analysis**: Critical path optimization and fmax calculation
- **Resource Utilization**: Efficient FPGA resource usage analysis
- **Hierarchical Design**: Modular component-based architecture
- **Comprehensive Testing**: Systematic verification methodology
- **Real-time Processing**: Clock domain management and synchronization

### Performance Metrics
Each project includes detailed performance analysis:
- Maximum operating frequency (fmax)
- Resource utilization (ALMs, registers, memory blocks)
- Critical path analysis
- Power consumption estimates

## Design Methodology

### VHDL Coding Standards
- **Structural Design**: Component-based hierarchical architecture
- **Behavioral Modeling**: Process-based sequential logic description
- **Testbench Development**: Comprehensive verification strategies
- **Timing Constraints**: Industry-standard SDC file usage

### Verification Strategy
- Functional simulation with comprehensive testbenches
- Timing simulation for post-synthesis verification
- Hardware validation on FPGA target platform
- Performance benchmarking and optimization

## Documentation

Each laboratory project includes:
- **Circuit Diagrams**: Hand-drawn schematics and block diagrams
- **State Diagrams**: FSM specifications and transitions
- **Timing Diagrams**: Waveform analysis and timing relationships
- **Performance Analysis**: Resource usage and timing reports
- **Implementation Notes**: Design decisions and optimizations

## Learning Outcomes

Upon completion of these laboratories, students will have gained proficiency in:

1. **Digital Design Fundamentals**
   - Combinational and sequential circuit design
   - Timing analysis and optimization
   - Hardware description language proficiency

2. **FPGA Development Workflow**
   - Design entry and synthesis
   - Simulation and verification
   - Place and route optimization
   - Hardware validation

3. **System Integration**
   - Hierarchical design methodology
   - Interface design and protocol implementation
   - Real-time system constraints
   - Performance optimization techniques


