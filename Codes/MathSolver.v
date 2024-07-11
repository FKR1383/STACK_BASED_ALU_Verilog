module MathSolver #(parameter length = 128, parameter n = 8)
(
	input [1:0][length-1:0][n-1:0] infix,
	output reg [n-1:0] result,
	wire [1:0][length-1:0][n-1:0] postfix, reg CLK, reg [n-1:0] input_data,
	reg [2:0] opcode,
	reg [n-1:0] first, reg [n-1:0] second, wire [n-1:0] output_data
);
	
	wire overflow;
	wire the_end;
	integer i = 0;
	InfixToPostfixModule #(length, n) inst (infix, postfix, the_end);
	STACK_BASED_ALU  #(n) inst2 (CLK, input_data, opcode, output_data, overflow);
	initial begin
			CLK = 0;
			#(50 * length + 5)
			for (i = 0; i <= length; i = i + 1) begin // start = 5 (reset!)
				if (postfix[0][i] == 'd36 && postfix[1][i] == 1) begin
					i = length + 1;
					opcode <= 'b111;
					#10 // 15 reset!
					opcode <= 'b000;
					result <= output_data;
				end else 
				if (postfix[1][i] == 1) begin
					opcode <= 'b111;
					#10; // 15 reset!
					if (postfix[0][i] == 'd45) begin // start = 5 (reset!)
						opcode <= 'b110;
						input_data <= -output_data;
						#10; // 15 reset!
					end else begin
						opcode <= 'b110;
						input_data <= output_data;
						#10; // 15 reset!
					end
					if (postfix[0][i] == 'd42) begin
						opcode <= 'b101; // multiply
					end else begin
						opcode <= 'b100; // plus, minus
					end
					#10 // 15 reset!
					input_data <= output_data;
					opcode <= 'b111;
					#20 // 25 reset!
					opcode <= 'b110;
					#10 // 15 reset!
					opcode <= 'b000;
				end else begin
					input_data = postfix[0][i];
					opcode <= 'b110;
					#10 // 15 reset!
					opcode <= 'b000;
				end
			end
	end
	always begin
		#10 CLK = ~CLK;
	end
endmodule
