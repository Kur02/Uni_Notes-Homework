module FullAdder (input logic i_a, 
                              i_b, 
                              i_c_in,

                  output logic o_result, 
                               o_c_out);

    logic r1, c1, c2;

    //Benennung der HA-Instanzen wie in Lecture 6, Slide 15.
    HalfAdder ha1(i_a, i_b, r1, c1);
    HalfAdder ha2(r1, i_c_in, o_result, c2);

    or c_out_or(o_c_out, c1, c2);

endmodule