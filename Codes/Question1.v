module STACK_BASED_ALU#(
    parameter n = 8
)(input CLK, [n-1:0]input_data, [2:0]opcode,
output reg [n-1:0] output_data, overflow
);
	parameter stack_depth = 10;
	reg [n-1:0] stack[0:(2**stack_depth)-1];
	reg [stack_depth-1:0]stack_pointer = 0;
	reg [2*n-1:0] result, first, second;
	always @(CLK) begin
		if (opcode == 3'b100) begin
			if (stack_pointer == 0) begin
				output_data <= 'bz;
				overflow <= 'bz;
			end else if (stack_pointer == 1) begin
				output_data <= 'bz;
				overflow <= 'bz;
			end else begin
				output_data <= stack[stack_pointer-1] + stack[stack_pointer-2];
				#1
				overflow <= (stack[stack_pointer-1][n-1] & stack[stack_pointer-2][n-1] & ~output_data[n-1]) 
				| (~stack[stack_pointer-1][n-1] & ~stack[stack_pointer-2][n-1] & output_data[n-1]);
			end
		end else if (opcode == 3'b110) begin
			if (stack_pointer <= (2**stack_depth)-2) begin
				stack[stack_pointer] <= input_data;
				overflow <= 'bz;
				#1
				stack_pointer <= stack_pointer + 1;
			end
		end else if (opcode == 3'b111) begin
			if (stack_pointer >= 1) begin
				output_data <= stack[stack_pointer-1];
				overflow = 'bz;
				#1
				stack_pointer <= stack_pointer - 1;
			end
		end else if (opcode == 3'b101) begin
			if (stack_pointer == 0) begin
				output_data <= 'bz;
				overflow <= 'bz;
			end else if (stack_pointer == 1) begin
				output_data <= 'bz;
				overflow <= 'bz;
			end else begin
				output_data <= stack[stack_pointer-1] * stack[stack_pointer-2];
				if (stack[stack_pointer-1][n-1] == 1'b0) begin
   					first <= {{n{1'b0}}, stack[stack_pointer-1]};
				end else begin
					first <= {{n{1'b1}}, stack[stack_pointer-1]};
				end

				if (stack[stack_pointer-2][n-1] == 1'b0) begin
   					second <= {{n{1'b0}}, stack[stack_pointer-2]};
				end else begin
					second <= {{n{1'b1}}, stack[stack_pointer-2]};
				end

				#0.5
				result <= first * second;
				#0.5
				if ((result[2*n-1:n-1] != {{n{result[2*n-1]}}, result[n-1]}) || 
				(first[2*n-1] ^ second[2*n-1] != output_data[n-1])) begin
			        	overflow <= 1'b1;
			        end else begin
			        	overflow <= 1'b0;
			        end
			end
		end else begin
			output_data <= 'bz;
			overflow <= 'bz;
		end
	end
endmodule
