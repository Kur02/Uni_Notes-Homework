module alu #(parameter N=64) (input  logic [N-1:0] i_a,
                                                   i_b,
                              input  logic [1:0]   i_alu_ctrl,  
                              output logic [N-1:0] o_result,
                              output logic         o_carry_out );

    logic [N-1:0] l_or, 
                  l_and,
                  l_not_b,
                  l_mux_out,
                  l_adder_out;
    
    assign l_not_b = ~i_b;   
    assign l_and = i_a & i_b;
    assign l_or = i_a | i_b;
    
    
    mux_2 #(N) mux2(.i_in0(i_b), .i_in1(l_not_b), .i_s(i_alu_ctrl[0:0]), .o_out(l_mux_out)); //mux2 --> wandelt eineghende zahl in inverse um, wenn splitter auf 1, else eingehende zahl

    adder #(N) adder(.i_a(i_a), .i_b(l_mux_out), .i_carry_in(i_alu_ctrl[0:0]), .o_s(l_adder_out), .o_carry_out(o_carry_out)); // adder --> führt subtraktion aus, wenn splitter auf 1, else addition

    mux_4 #(N) mux4(.i_in0(l_adder_out), .i_in1(l_adder_out), .i_in2(l_and), .i_in3(l_or), .i_s(i_alu_ctrl), .o_out(o_result)); //mux4 --> entscheidet ob alu UND, ODER, SUBTRAKTION oder ADDITION verwendet

endmodule