This is the first part of the laboratory.

In this folder you will find the first two examples DFF and half_adder we saw in the previous introductory class.

The first excercise you can do is to build a clocked version of the half_adder design. To do that:
- create a new folder in your workspace
- copy the vhdl source (half_adder.vhd) and test bench (half_adder_tb.vhd) from the half_adder folder to this new folder
- modify the source file by adding an input port acting as a clock and create a process with only the clock signal in the sensitivity list. This will strobe the logic of a normal half_adder
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

You can find a clocked and a fully sequential implementation of the full_adder in the respective folders of this repository.

In the third excercise we are going to create a 2bit counter. The idea is to generate an output that increases every time a rising edge of the clock is received. When a reset is asserted, the counter output will be 0.

To do that:
- create a new folder in which this new design will be implemented
- create a file named "counter_2bit.vhdl" and define the entity with two 1bit input (clk and rst) and a single 2bit output (count)
- for this example we are going to use the `ieee.numeric_std.all` package so use it together with the `ieee.std_logic_1164.all`
- in the architecture, declare a 2bit signal of `unsigned` type (u_count) and initialize at 0 (remember that this is a 2 bit signal so you must use the quotation marks `signal u_count: unsigned (1 downto 0):="00"`
- the architecture is composed by two concurrent processes. The first one is in charge of incresing u_count (and control the overflow of it), while the second one is in charge of putting the value of `u_count` into the `count` port (this second process is just a cuncurrent statement)
- create a sequential process with clk and rst in the sensitivity list
- first of all define the behaviour of the device when the rst is 1 `if rst = '1' then` your `unsigned` signal musto go to 0
- now if rst is 0 and a rising edge of the clock is recognized, `u_count` is increased by 1
- add the overflow control `if u_count="11" then u_count="00"
- end the ifs and the process
- before ending the architecture, add the cucnurrent statement `count<=std_logic_vector(u_count)`. In this way, the value of `u_count` is converted in a std_logic_vector and assigned to `count`

The test bench of this design is quite easy. Using the flipflop tb try to elaborate the tb for this design. The rst must be asserted to 1 for the first x ns and then set to 0 to allow the design to work.

To help you in the debugging, there is my version on the excercise in the 2bit_counter folder of this repository.

The forth excercise is to build a 2bit ripple-carry adder (https://en.wikipedia.org/wiki/Adder_(electronics)#Ripple-carry_adder). We can use the structural approach and connect 2 single bit full-adders accordingly with this figure:

![alt text](Full-adder_logic_diagram.svg.png)

