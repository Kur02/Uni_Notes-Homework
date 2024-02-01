/**
* 4-bit Shifter.
*
* @param i_a input A.
* @param i_d shift-direction.
* @param o_s output of shift operation
**/
module shifter_4
    (   
        input logic [3:0] i_a,
        input logic       i_d,
        output logic [3:0] o_s
    );
    
    //TODO: implement 4-bit shifter here

    mux21 m0( i_a[1],   1'b0, i_d, o_s[0] );
    mux21 m1( i_a[2], i_a[0], i_d, o_s[1] );
    mux21 m2( i_a[3], i_a[1], i_d, o_s[2] );
    mux21 m3(   1'b0, i_a[2], i_d, o_s[3] );

endmodule