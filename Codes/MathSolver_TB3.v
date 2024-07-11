

module MathSolver_TB3();
	reg [1:0][18:0][15:0] infix;
	wire [1:0][18:0][15:0] postfix;
	wire [15:0] result;
	wire CLK; wire [15:0] input_data;
	wire [2:0] opcode;
	wire [15:0] first; wire [15:0] second; wire [15:0] output_data;
	MathSolver #(19, 16) inst(infix, result, postfix, CLK, input_data, opcode, first, second, output_data);
	initial begin
		infix[0][0] = 'd2;
		infix[0][1] = 'd42;
		infix[0][2] = 'd3;
		infix[0][3] = 'd43;
		infix[0][4] = 'd40;
		infix[0][5] = 'd10;
		infix[0][6] = 'd43;
		infix[0][7] = 'd4;
		infix[0][8] = 'd43;
		infix[0][9] = 'd3;
		infix[0][10] = 'd41;
		infix[0][11] = 'd42;
		infix[0][12] = -'d20;
		infix[0][13] = 'd43;
		infix[0][14] = 'd40;
		infix[0][15] = 'd6;
		infix[0][16] = 'd43;
		infix[0][17] = 'd5;
		infix[0][18] = 'd41;

		infix[1][0] = 0;
		infix[1][1] = 1;
		infix[1][2] = 0;
		infix[1][3] = 1;
		infix[1][4] = 1;
		infix[1][5] = 0;
		infix[1][6] = 1;
		infix[1][7] = 0;
		infix[1][8] = 1;
		infix[1][9] = 0;
		infix[1][10] = 1;	
		infix[1][11] = 1;
		infix[1][12] = 0;
		infix[1][13] = 1;
		infix[1][14] = 1;
		infix[1][15] = 0;
		infix[1][16] = 1;
		infix[1][17] = 0;
		infix[1][18] = 1;

	end
endmodule