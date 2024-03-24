module FullAdder (input logic a, 
                              b, 
                              c_in,

                  output logic s, 
                               c_out    );

    logic s1, c1, c2;

    //Benennung der HA-Instanzen wie in Lecture 6, Slide 15.
    HalfAdder ha1(a, b, s1, c1);
    HalfAdder ha2(s1, c_in, s, c2);

    or c_out_or(c_out, c1, c2);

endmodule