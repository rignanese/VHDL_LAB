# VHDL_LAB
VHDL laboratory repository
This repository is a container of some of the code we will use in our laboratories.
Please, take a look at the repository from Giacomo: https://github.com/GiacomoLevrini/VHDL_for_beginners you will find the list of commands you need to compile and simulate your VHDL code.

To summarize here is the list of commands you will use:
- ```ghdl -s source.vhdl``` makes a syntax check of the files ;
- ```ghdl -a source.vhdl``` analyze the files;
- ```ghdl -e "entity_in_TB"``` elaborate the entity defined in the files;
- ```ghdl -r "entity_in_TB"``` runs the files, generating a waveform file which can be displayed.

As an example:
```
cd ~/path/to/your/VHDL/code
ghdl -a your_source.vhd
ghdl -a your_test_bench.vhd
ghdl -e test_bench (entity name in your test_bench)
ghdl -r test_bench --vcd=waves.vcd --disp-time --stop-time=100ns
gtkwave waves.vcd
```
