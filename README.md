
# Stack Based ALU and infix math expressions solver

My project is a Stack based ALU and math expression solver using Verilog HDL
for more details, see Doc.pdf

## Tools
- Modelsim and Verilog HDL


## Implementation Details

I use Verilog HDL to make these files:
Question1.v : file of Stack Based ALU module.
InfixToPostfix.v : file of a module that convert infix to postfix expression. for this purpose, i use algorithm in this link: 

https://www.andrew.cmu.edu/course/15-200/s06/applications/ln/junk.html#:~:text=To%20convert%20an%20infix%20expression,same%20expression%20in%20prefix%20notation

MathSolver.v : file of module that uses InfixToPostfix module and StackBasedALU module to solve and expression.

There are some testbench files to see how the program works...

## How to Run

Just open the files in modelsim and use simulation to see waveforms.
Or see the Doc.pdf file for more details.




## Results
see Doc.pdf



## Authors
- [Farzam Koohi Ronaghi](https://github.com/FKR1383)

