module register_en_4( input  logic       i_clk,
                      input  logic       i_en,
                      input  logic [3:0] i_d,
                      output logic [3:0] o_q );
    
    d_flip_flop_en d_flip_flop_en1(.i_clk(i_clk), .i_en(i_en), .i_d(i_d[0]), .o_q(o_q[0]));
    d_flip_flop_en d_flip_flop_en2(.i_clk(i_clk), .i_en(i_en), .i_d(i_d[1]), .o_q(o_q[1]));
    d_flip_flop_en d_flip_flop_en3(.i_clk(i_clk), .i_en(i_en), .i_d(i_d[2]), .o_q(o_q[2]));
    d_flip_flop_en d_flip_flop_en4(.i_clk(i_clk), .i_en(i_en), .i_d(i_d[3]), .o_q(o_q[3]));

endmodule

/**
 * Allows to save/write and load/read 4bit of information at once
 * has 4bits of data input (d0 - d3)
 * has 4bits of data output (q0 -q3)
 * EN (enables) --> Boolean defining if current information at data input is saved
 * CLK --> to time saving/loading data
*/