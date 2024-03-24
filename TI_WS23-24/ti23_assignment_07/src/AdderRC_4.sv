/**
 * 4-bit RC-Adder.
 *
 * @param i_a input a.
 * @param i_b input b.
 * @param o_s output sum s of inputs.
 **/
module AdderRC_4 ( input logic [3:0] i_a,
                   input logic [3:0] i_b,
                   output logic [4:0] o_s );
    
    //output
    logic s0, c0,
          s1, c1,
          s2, c2,
          s3, c3;

    //Carry-In = 0 für FA0, da kein entsprechendes Input im RC-Adder existiert.
    FullAdder FA0 (i_a[0], i_b[0], 1'b0, s0, c0);
    FullAdder FA1 (i_a[1], i_b[1],   c0, s1, c1);
    FullAdder FA2 (i_a[2], i_b[2],   c1, s2, c2);
    FullAdder FA3 (i_a[3], i_b[3],   c2, s3, c3);

    assign o_s[0] = s0;
    assign o_s[1] = s1;
    assign o_s[2] = s2;
    assign o_s[3] = s3;
    assign o_s[4] = c3;

endmodule