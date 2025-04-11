# Digital Systems Electronics Labs

This repository contains the VHDL code and related files for the Digital Systems Electronics labs. The labs are organized into separate directories, each corresponding to a specific lab assignment.

## Repository Structure

The repository is structured as follows:

-   `LAB 1/`: Contains the files for Lab 1.
    -   `VHDL FILES/`: Contains the VHDL source files.
        -   `Part 2/`: Files for Part 2 of Lab 1.
            -   `mux2to1_tb.vhd`: Testbench for the 2-to-1 multiplexer.
            -   `mux2to1.vhd`: VHDL code for a 2-to-1 multiplexer.
        -   `PART 3/`: Files for Part 3 of Lab 1.
            -   `MUX2TO1.vhd`: VHDL code for a 2-to-1 multiplexer.
            -   `MuX5to1_TB.vhd`: Testbench for the 5-to-1 multiplexer.
            -   `MuX5to1.vhd`: VHDL code for a 5-to-1 multiplexer.
        -   `Part1/`: Files for Part 1 of Lab 1.
-   `LAB 2/`: Contains the files for Lab 2.
    -   `part1/`: Files for Part 1 of Lab 2.
        -   `lab2part1_TB.vhd`: Testbench for Part 1 of Lab 2.
        -   `lab2part1.vhd`: VHDL code for Part 1 of Lab 2.
        -   `segmentdecoder7.vhd`: VHDL code for a 7-segment display decoder.
    -   `part2/`: Files for Part 2 of Lab 2.
        -   `decoder7.vhd`: VHDL code for a 7-segment display decoder.
        -   `mux.vhd`: VHDL code for a multiplexer.
        -   `part2.vhd`: VHDL code for Part 2 of Lab 2.
        -   `shifter.vhd`: VHDL code for a shifter.
        -   `testbench.vhd`: Testbench for Part 2 of Lab 2.
    -   `Part3/`: Files for Part 3 of Lab 2.
        -   `lab2_3_circuitA.vhd`: VHDL code for circuit A in Part 3.
        -   `lab2_3_circuitB.vhd`: VHDL code for circuit B in Part 3.
        -   `lab2_3_comparator.vhd`: VHDL code for a comparator in Part 3.
        -   `lab2_3_decoder0.vhd`: VHDL code for a decoder in Part 3.
        -   `lab2_3_mux.vhd`: VHDL code for a multiplexer in Part 3.
        -   `part3_tb.vhd`: Testbench for Part 3 of Lab 2.
        -   `part3.vhd`: VHDL code for Part 3 of Lab 2.
    -   `part4/`: Files for Part 4 of Lab 2.
        -   `comparatorled.vhd`: VHDL code for a comparator with LED output.
        -   `comparatormain.vhd`: VHDL code for the main comparator.
        -   `...`: (Other files for Part 4)
-   `LAB 3/`: Contains the files for Lab 3.
    -   `part1_2/`: Files for Part 1 and 2 of Lab 3.
        -   `decoder.vhd`: VHDL code for a decoder.
        -   `fa.vhd`: VHDL code for a full adder.
        -   `flipflop.vhd`: VHDL code for a flip-flop.
        -   `overflow.vhd`: VHDL code for overflow detection.
        -   `part2_complete.vhd`: VHDL code for the complete Part 2.
        -   `part2.vhd`: VHDL code for Part 2 of Lab 3.
        -   `rca.vhd`: VHDL code for a ripple carry adder.
        -   `testbench.vhd`: Testbench for Part 1 and 2 of Lab 3.
        -   `...`: (Other files for Part 1 and 2)
    -   `part2/`: Files for Part 2 of Lab 3.
    -   `part3/`: Files for Part 3 of Lab 3.
        -   `part3/`: Files for Part 3 of Lab 3.
            -   `part3_csea/`: Files for carry-select adder implementation.
                -   `part3_csea.mpf`: Project file for ModelSim.
                -   `csea.vhd`: VHDL code for carry select adder.
                -   `csea_tb.vhd`: Testbench for carry select adder.
                -   `fa.vhd`: VHDL code for a full adder.
                -   `flipflop.vhd`: VHDL code for a flip-flop.
                -   `mux2to1.vhd`: VHDL code for a 2-to-1 multiplexer.
                -   `mux2to1_4bit.vhd`: VHDL code for a 4-bit 2-to-1 multiplexer.
                -   `ovf.vhd`: VHDL code for overflow detection.
                -   `part3_tb.vhd`: Testbench for Part 3 of Lab 3.
                -   `rca4.vhd`: VHDL code for a 4-bit ripple carry adder.
                -   `regn.vhd`: VHDL code for a register.
            -   `part3_cska/`: Files for carry-skip adder implementation.
                -   `part3_cska.mpf`: Project file for ModelSim.
                -   `cska.vhd`: VHDL code for carry skip adder.
    -   `PART4/`: Files for Part 4 of Lab 3.
        -   `part4.vhd`: VHDL code for Part 4 of Lab 3.
        -   `rca.vhd`: VHDL code for a ripple carry adder.
-   `LAB 4/`: Contains the files for Lab 4.
    -   `PART 1/`: Contains the files for Part 1 of Lab 4.
        -   `part1_tb.vhd`: Testbench for Part 1 of Lab 4.
        -   `part1.vhd`: VHDL code for Part 1 of Lab 4.
    -   `PART 2/`: Contains the files for Part 2 of Lab 4.
        -   `decoder.vhd`: VHDL code for a decoder.
        -   `fourtff.vhd`: VHDL code for a 4-bit flip-flop register.
        -   `part2_tb.vhd`: Testbench for Part 2 of Lab 4.
        -   `part2.vhd`: VHDL code for Part 2 of Lab 4.
    -   `PART 3/`: Contains the files for Part 3 of Lab 4.
    -   `part4/`: Contains the files for Part 4 of Lab 4.
        -   `mod10.vhd`: VHDL code for a mod-10 counter.
        -   `mod50m.vhd`: VHDL code for a mod-50 million counter.
        -   `part4.vhd`: VHDL code for Part 4 of Lab 4.
        -   `part4_tb.vhd`: Testbench for Part 4 of Lab 4.

## VHDL Files

Each lab directory contains VHDL files that implement the required digital circuits. The VHDL files are named according to their function, and each file contains a header comment that describes the purpose of the file.

## Testbenches

Each lab directory also contains testbenches that are used to verify the functionality of the VHDL code. The testbenches are named with the `_tb.vhd` suffix, and each testbench contains a header comment that describes the purpose of the testbench.

## ModelSim Project Files

Some labs include ModelSim project files (`.mpf`) for simulation and testing. These files contain the project settings and file dependencies for the corresponding lab.

## How to Use

To use the code in this repository, follow these steps:

1.  Clone the repository to your local machine.
2.  Open the VHDL files in your preferred VHDL editor.
3.  Simulate the VHDL code using a VHDL simulator such as ModelSim.
4.  Verify the functionality of the VHDL code using the testbenches provided.

## Notes

-   This repository is intended for educational purposes only.
-   The VHDL code in this repository is provided as-is, without warranty of any kind.
-   Feel free to use the code in this repository for your own projects, but please give credit to the original authors.