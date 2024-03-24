module HalfAdder (input logic a, b,
                  output logic s, c);

    //Cf. Lecture 6, Slide 14.
    assign c = a & b;
    assign s = a ^ b;
    
endmodule