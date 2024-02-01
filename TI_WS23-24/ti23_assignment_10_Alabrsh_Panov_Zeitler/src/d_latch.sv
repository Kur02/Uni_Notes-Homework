module d_latch( input logic i_d,
                input logic i_clk,
                output logic o_q,
                output logic o_qinv);

    logic l_r, //l_r = output of and1 going into SR-Latch input R
          l_s, //L_s = output of and2 going into SR-Latch input S
          l_d_not;
   
    assign l_d_not = ~i_d;
    assign l_r = i_clk & l_d_not; //RESET will be 1, if CLK is 1 an 
    assign l_s = i_clk & i_d; //SET will be 1, if CLK is 1 and D is 1

    sr_latch sr_latch(.i_r(l_r), .i_s(l_s), .o_q(o_q), .o_qinv(o_qinv));
endmodule


/* 
 * D-Latch can store one bit information 
 * If Clock Signal is 1 (high), then set D as Output 
 * Otherwise the output is the output
*/