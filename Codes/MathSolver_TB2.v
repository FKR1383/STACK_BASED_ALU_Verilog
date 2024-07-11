
module MathSolver_TB2();
	reg [1:0][12:0][15:0] infix;
	wire [1:0][12:0][15:0] postfix;
	wire [15:0] result;
	wire CLK; wire [15:0] input_data;
	wire [2:0] opcode;
	wire [15:0] first; wire [15:0] second; wire [15:0] output_data;
	MathSolver #(13, 16) inst(infix, result, postfix, CLK, input_data, opcode, first, second, output_data);
	initial begin
		infix[0][0] = -'d4;
		infix[0][1] = 'd45;
		infix[0][2] = 'd40;
		infix[0][3] = 'd42;
		infix[0][4] = 'd42;
		infix[0][5] = 'd43;
		infix[0][6] = 'd45;
		infix[0][7] = 'd40;
		infix[0][8] = 'd41;
		infix[0][9] = 'd43;
		infix[0][10] = 'd40;
		infix[0][11] = 'd41;
		infix[0][12] = 'd41;

		infix[1][0] = 0;
		infix[1][1] = 1;
		infix[1][2] = 1;
		infix[1][3] = 0;
		infix[1][4] = 1;
		infix[1][5] = 0;
		infix[1][6] = 1;
		infix[1][7] = 1;
		infix[1][8] = 0;
		infix[1][9] = 1;
		infix[1][10] = 0;	
		infix[1][11] = 1;
		infix[1][12] = 1;
	end
endmodule