// TODO: FInish the iplemetation od the module
// such that it computes the XOR of the three inputs.
// Namely, the output has the value of 1 
// if an odd number of the three inputs has value 1,
// otherwise, the output has the value 0.

module xor_3 ( input logic i_in0,
                           i_in1,
                           i_in2,
               output logic o_res );

    assign o_res = i_in0 ^ i_in1 ^ i_in2;
    
endmodule