module STACK_BASED_ALU_TB4;
	parameter n = 4;
	reg [2:0]opcode;
	reg [n-1:0]input_data;
	reg CLK;
	wire [n-1:0]output_data;
	wire overflow;
	integer i = 0;
	always begin
		#5 CLK = ~CLK;
	end
	STACK_BASED_ALU #(n) inst(CLK, input_data, opcode, output_data, overflow);
	initial begin
		CLK = 0;
		opcode = 'b000;
		#5 opcode = 'b110; input_data = 'd14;
		#5 input_data = 'd7;
		#5 input_data = -'d2;
		#5 input_data = -'d1;
		#5 input_data = -'d8;
		#5 input_data = 'd7;
		for (i = 0; i < 5; i = i + 1) begin
			#5 opcode = 'b100;
			#5 opcode = 'b101;
			#5 opcode = 'b111;
		end
		
		#10 $stop();
	end
endmodule
