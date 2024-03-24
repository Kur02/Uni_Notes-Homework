module accumulator_4( input logic i_CLK,
                      input logic i_EN,
                      input logic [1:0] i_C, //i_C[1] ist c1, i_C[0] ist c0
                      input logic [3:0] i_D,
                      output logic o_Carry,
                      output logic [3:0] o_Q );
    logic [3:0] l_ZY,
                l_mux_QD;

    mux_8_4 mux8_4 (.i_a(l_ZY), .i_b(i_D), .i_s(i_C[1]), .o_out(l_mux_QD)); //mit c1
                  
    register_en_4 reg4 (.i_clk(i_CLK), .i_en(i_EN), .i_d(l_mux_QD), .o_q(o_Q));

    Adder_Subtractor addSub (.i_a(o_Q), .i_b(i_D), .i_ctrl(i_C[0]), .o_result(l_ZY), .o_carry_out(o_Carry)); //mit c0

endmodule