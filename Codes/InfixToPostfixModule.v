module InfixToPostfixModule #(parameter length = 128, parameter n = 8)
( input [1:0][length-1:0][n-1:0] infix,
output reg [1:0][length-1:0][n-1:0] postfix, reg the_end);
	reg [2:0]opcode;
	reg [n-1:0]input_data;
	reg CLK;
	wire [n-1:0]output_data;
	wire overflow;
	reg [n-1:0] token, top_of_stack;
	integer i = -1;
	integer j = 0;
	integer check = 0;
	STACK_BASED_ALU #(n) inst(CLK, input_data, opcode, output_data, overflow);
	always begin
		#10 CLK = ~CLK;
	end
	always begin
		#5; // 5
		for (i = 0; i <= length; i = i + 1) begin
			if (i == 0) begin // start = 5
				input_data <= 'd40;
				opcode <= 'b110;
				#10; // 15 -- reset!
		    end else begin // start: 5
				token <= infix[0][i-1][n-1:0];
				opcode <= 'b000;
				#1 // 6
				if (infix[1][i-1][n-1:0] == 0) begin // start = 6
					postfix[0][j][n-1:0] <= token;
					postfix[1][j][n-1:0] <= 0;
					#1; // 7
					j = j + 1;
					#8; // 15 -- reset!
				end else begin // start = 6
					opcode <= 'b111;
					#5 // 11
					top_of_stack <= output_data;
					#1 // 12
					opcode <= 'b000;
					#3 // 15 -- reset!
					if ((top_of_stack == 'd40 && (token == 'd41)) || ((top_of_stack == 'd43 || top_of_stack == 'd45) && (token == 'd41 || token == 'd43 || token == 'd45)) || ((top_of_stack == 'd42) && (token == 'd41 || token == 'd43 || token == 'd45 || token == 'd42))) begin // start = 5 (reset)
						if (top_of_stack != 'd40) begin // start = 5 (reset)
							postfix[0][j][n-1:0] <= top_of_stack;
							postfix[1][j][n-1:0] <= 1;
							#1; // 6
							j = j + 1;
							check = 0;
                            #9; // 15 reset!
							while (check < 1) begin // start = 5 (reset)
								opcode <= 'b111;
								#6 // 11
								top_of_stack <= output_data;
								#1 // 12
								opcode <= 'b001;
								#3 // 15 reset!
								if (((top_of_stack == 'd40 && token == 'd41) || ((top_of_stack == 'd43 || top_of_stack == 'd45) && (token == 'd41 || token == 'd43 || token == 'd45)) || ((top_of_stack == 'd42) && (token == 'd41 || token == 'd43 || token == 'd45 || token == 'd42)))) begin // start = 5 (reset)
									if (top_of_stack != 'd40) begin // start = 5 (reset)
										postfix[0][j][n-1:0] <= top_of_stack;
										postfix[1][j][n-1:0] <= 1;
										#1; // 1
										j = j + 1;
                                        #9; // 15 reset!
									end else begin
                                        check = 1;
                                    end
								end else begin // start = 5 (reset)
                                    opcode <= 'b110;
                                    input_data <= top_of_stack;
                                    #6 // 11
                                    if (token != 'd41) begin // start = 11
                                        input_data <= token;
                                        #10 // 21
                                        opcode <= 'b000;
                                        #4; // 25 reset!
                                    end else begin // start = 11
                                        opcode <= 'b000;
                                        #4; // 15 reset!
                                    end
                                    check = 1;
								end 
							end
						end
					end else begin // start = 5 (reset)
						opcode <= 'b110;
						input_data <= top_of_stack;
						#6 // 11
						if (token != 'd41) begin // start = 11
							input_data <= token;
							#10 // 21
							opcode <= 'b000;
							#4; // 25 reset!
						end else begin // start = 11
							opcode <= 'b000;
							#4; // 15 reset!
						end
						
					end
					
				end
				
			end
		end

        opcode <= 'b111;
		#6 // 11
	    top_of_stack <= output_data;
		#1 // 12
		opcode <= 'b001;
		#3 // 15 reset!
        while (top_of_stack != 'd40) begin // start = 5 (reset)
            postfix[0][j][n-1:0] <= top_of_stack;
            postfix[1][j][n-1:0] <= 1;
            #1; // 6
            j = j + 1;
            #9; // 15
            // start = 5 (reset)
            opcode <= 'b111; 
            #6 // 11
            top_of_stack <= output_data;
            #1 // 12
            opcode <= 'b001;
            #3; // 15 reset!
        end
	postfix[0][j][n-1:0] <= 'd36;
	postfix[1][j][n-1:0] <= 1;
        #1; // 6
        j = j + 1;
        #9; // 15
	the_end <= 1;
	end
	initial begin
		the_end = 0;
		CLK = 0;
		#(400 * length + 20)
		$stop();
	end
	
	
	
endmodule
