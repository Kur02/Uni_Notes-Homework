// TODO: finish the implementation by determining the flags 
// Set the output o_nzcv such that 
// o_nzcv[0] indicates a negative result,
// o_nzcv[1] indicates a zero result,
// o_nzcv[2] indicates a carry over, and 
// o_nzcv[3] indicates an overflow.

module alu_nzcv #(parameter N=64) (input  logic [N-1:0] i_a, i_b,
                                   input  logic [1:0]   i_alu_ctrl,
                                   output logic [N-1:0] o_result,
                                   output logic [3:0]   o_nzcv );

    logic [N-1:0] l_alu_result;  
    logic l_alu_carry_out,
          l_xorA,
          l_xorB,
          l_xorB_not;

    alu #(N) alu(.i_a(i_a), .i_b(i_b), .i_alu_ctrl(i_alu_ctrl), .o_result(l_alu_result), .o_carry_out(l_alu_carry_out));

    // Result 
    assign o_result = l_alu_result;

    // NEG (negative result / NegativeFlag)
    assign o_nzcv[0] = l_alu_result[N-1]; //if 1, then result negative, if 0, then result positive

    // ZER (zero result / ZeroFlag)
    assign o_nzcv[1] = l_alu_result[N-1:0] == 0; // working with boolean, if Result (inverse) is 0, then its true

    // CARRY (carry over / CarryFlag)
    assign o_nzcv[2] = ~(i_alu_ctrl[1]) & l_alu_carry_out;

    // building oVerflow (OverflowFlag)
    assign l_xorA = l_alu_result[N-1] ^ i_a[N-1];

    xor_3  xor3(i_a[N-1], i_b[N-1], i_alu_ctrl[0], l_xorB);

    assign l_xorB_not = ~l_xorB;

    assign o_nzcv[3] = ~(i_alu_ctrl[1]) & l_xorA & l_xorB_not;

endmodule