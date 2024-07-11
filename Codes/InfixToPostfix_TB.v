module InfixToPostfix_TB;
	reg [1:0][10:0][7:0] infix;
	wire [1:0][10:0][7:0] postfix;
	wire [7:0] token;
	wire [7:0] top;
	wire CLK;
	wire [2:0] opcode;
	wire [7:0]input_data;
	wire [7:0] output_data;
	InfixToPostfix #(11, 8) inst(infix, postfix, token, top, CLK, opcode, input_data, output_data);
	initial begin
		infix[0][0] = 'd5;
		infix[0][1] = 'd42;
		infix[0][2] = 'd40;
		infix[0][3] = 'd4;
		infix[0][4] = 'd45;
		infix[0][5] = 'd2;
		infix[0][6] = 'd43;
		infix[0][7] = 'd1;
		infix[0][8] = 'd41;
		infix[0][9] = 'd45;
		infix[0][10] = 'd6;

		infix[1][0] = 0;
		infix[1][1] = 1;
		infix[1][2] = 1;
		infix[1][3] = 0;
		infix[1][4] = 1;
		infix[1][5] = 0;
		infix[1][6] = 1;
		infix[1][7] = 0;
		infix[1][8] = 1;
		infix[1][9] = 1;
		infix[1][10] = 0;	
		
	end
endmodule;
