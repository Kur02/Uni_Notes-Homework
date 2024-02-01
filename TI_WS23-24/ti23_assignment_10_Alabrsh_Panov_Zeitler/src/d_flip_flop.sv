module d_flip_flop( input logic i_d,
                    input logic i_clk,
                    output logic o_q,
                    output logic o_qinv);

    logic l_clk_not, l_q_out, l_qinv_out;
    
    assign l_clk_not = ~i_clk; //iverted CLK Signal for first D-Latch
   
    d_latch d_latch_1(.i_clk(l_clk_not), .i_d(i_d), .o_q(l_q_out), .o_qinv(l_qinv_out));
                         
    d_latch d_latch_2(.i_clk(i_clk), .i_d(l_q_out), .o_q(o_q), .o_qinv(o_qinv));
                                           
endmodule

/*
 * D-FlipFlop stores one bit information 
 * it has 2 Inputs: Data (D) and ClockSignal (CLK)
 * the outputs Q and -Q match with the value of the internal state
 * internal state is set to the data signal D, whenever CLK changes from LOW to HIGH --> rising edge triggered
 * Output gets set 1, if D is 1 and there is a rising edge after or at the same time 
*/
