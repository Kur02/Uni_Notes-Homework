module mux_2 #(parameter N=64) (input  logic [N-1:0] i_in0,
                                                     i_in1,
                                input  logic         i_s,
                                output logic [N-1:0] o_out );

    assign o_out = i_s ? i_in1: i_in0;

endmodule