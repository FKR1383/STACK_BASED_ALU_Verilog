
# Stack Based ALU and infix math expressions solver

My project is a Stack based ALU and math expression solver using Verilog HDL
for more details, see Doc.pdf

With this program, you can input an Math expression using sum, subtract and multiply and the program converts it to postfix form and using the Stack based ALU, the result will be calculated.

Some waveform pictures are in Doc.pdf that shows the correctness of program.

<img width="1025" height="477" alt="image" src="https://github.com/user-attachments/assets/11bfb591-9255-474e-9cba-9cbca8f3a7ef" />


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

