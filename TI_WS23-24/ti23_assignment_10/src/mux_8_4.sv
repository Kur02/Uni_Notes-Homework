module mux_8_4 ( input  logic [3:0] i_a,
                                    i_b,                  
                 input  logic [0:0] i_s,
                 output logic [3:0] o_out);

    assign o_out = i_s ? i_a : i_b;            
    
endmodule