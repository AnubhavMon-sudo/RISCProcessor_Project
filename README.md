This is a five stage pipelined processor designed along with a hazard detection and forwarding unit.
The processor supports R type, I type and store word instructions. No stalls were used while designing since they were not necessitated for the set of Instructions. The set of instructions which have been used while designing are :

XNOR reg3, reg2, reg1

SW reg3, 6(reg4)

ADDI reg5, reg3, E571

AND reg8, reg7, reg6

SUB reg9, reg8, reg5

The registers were initiated with values as shown below: reg1=5671E, reg2=98AAA, reg4=A, reg6=F1234, reg7=7660A.

The codes for the submodules and the top level module used in the design have been attached. 



