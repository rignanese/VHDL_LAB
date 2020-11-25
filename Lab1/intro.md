This is the first part of the laboratory.

In this folder you will find the first two examples DFF and half_adder we saw in the previous introductory class.

The first excercise you can do is to build a clocked version of the half_adder design. To do that:
- create a new folder in your workspace
- copy the vhdl source (half_adder.vhd) and test bench (half_adder_tb.vhd) from the half_adder folder to this new folder
- modify the source file by adding an input port acting as a clock and create a process with only the clock signal in the sensitivity list
- compile the file and look if everything it's fine (`ghdl -a "source_name.vhdl"`)
- modify the test bench file accordingly to the new design (map the additional port) and create a clock cycle of 5 ns
- compile the new test bench (`ghdl -a "test_bench_name.vhdl"`)
- elaborate the simulation (`ghdl -e "entity_name_of_test_bench_file"`)
- run the simulation (`ghdl -r "entity_name_of_test_bench_file" --vcd=waves.vcd --disp-time --stop-time=100ns`)
- run `gtkwave waves.vcd` and visualize the waveforms.

To help you in the debugging, there is my version on the excercise in the clocked_half_adder folder

The second excercise consists in creating a sngle bit full adder. To do that you can simply add the carry_in port to the half_adder design and compute the new logic: 

SUM = A ⊕ B ⊕ Cin and C_out = (A ⋅ B) + (C_in ⋅ (A ⊕ B)) 

![alt text](Full-adder_logic_diagram.svg.png)
