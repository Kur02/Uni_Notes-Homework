module d_flip_flop_en( input logic i_d,
                       input logic i_en,
                       input logic i_clk,
                       output logic o_q);
    logic l_d_out;

    assign l_d_out = i_en ? i_d : o_q; //checking if EN is set --> if set: D is Input, else: previous output

    d_flip_flop d_flip_flop(.i_d(l_d_out), .i_clk(i_clk), .o_q(o_q));
                                                   
endmodule

/*
 * Enabled FlipFlop is a D FlipFlop with an enabled signal EN 
 * EN allows to set input D individually 
 * D will only be set if EN is 1
 * if D is enabled, Output will be D when rising edge, else output
*/