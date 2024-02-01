module Adder_Subtractor ( input  logic [3:0] i_a,
                                             i_b,
                          input  logic [0:0] i_ctrl,  
                          output logic [3:0] o_result,
                          output logic       o_carry_out);

      logic l_xor_out0, 
            l_xor_out1, 
            l_xor_out2, 
            l_xor_out3,
            l_c0, l_c1, l_c2;
    
      assign l_xor_out0 = i_ctrl ^ i_b[0];
      FullAdder fullAdder0(.i_a(i_a[0]), .i_b(l_xor_out0), .i_c_in(i_ctrl), .o_result(o_result[0]), .o_c_out(l_c0));

      assign l_xor_out1 = i_ctrl ^ i_b[1];
      FullAdder fullAdder1(.i_a(i_a[1]), .i_b(l_xor_out1), .i_c_in(l_c0), .o_result(o_result[1]), .o_c_out(l_c1));

      assign l_xor_out2 = i_ctrl ^ i_b[2];
      FullAdder fullAdder2(.i_a(i_a[2]), .i_b(l_xor_out2), .i_c_in(l_c1), .o_result(o_result[2]), .o_c_out(l_c2));

      assign l_xor_out3 = i_ctrl ^ i_b[3];
      FullAdder fullAdder3(.i_a(i_a[3]), .i_b(l_xor_out3), .i_c_in(l_c2), .o_result(o_result[3]), .o_c_out(o_carry_out));

endmodule