module register_file_4( input  logic       i_clk,
                        input  logic [1:0] i_reg_read_0, //Read_ID_0
                        input  logic [1:0] i_reg_read_1, //Read_ID_1
                        input  logic [1:0] i_reg_write, //Write_ID
                        input  logic [3:0] i_port_write, //data input
                        input  logic       i_write_enable, //EN (enable)
                        output logic [3:0] o_port_read_0, //Data_Read_0
                        output logic [3:0] o_port_read_1 ); //Data_Read_1

    logic [3:0] l_dec_out, l_slot1_out, l_slot2_out, l_slot3_out, l_slot4_out;
    logic l_en1, l_en2, l_en3, l_en4;

    // Decoder -> to choose which slot should be used to save the 4 bit input data in 
    //2bit in, 4bit out
    decoder_2_4 decoder(.i_binary(i_reg_write), .o_choose(l_dec_out));

    //if 00 --> then save data in 0001
    assign l_en1 = i_write_enable & l_dec_out[0];
    register_en_4 slot1(.i_clk(i_clk), .i_en(l_en1), .i_d(i_port_write), .o_q(l_slot1_out));

    //if 01 --> then save in 0010
    assign l_en2 = i_write_enable & l_dec_out[1];
    register_en_4 slot2(.i_clk(i_clk), .i_en(l_en2), .i_d(i_port_write), .o_q(l_slot2_out));
    
    //if 10 --> then save in 0100
    assign l_en3 = i_write_enable & l_dec_out[2];
    register_en_4 slot3(.i_clk(i_clk), .i_en(l_en3), .i_d(i_port_write), .o_q(l_slot3_out));
    
    //if 11 --> then save in 1000
    assign l_en4 = i_write_enable & l_dec_out[3];
    register_en_4 slot4(.i_clk(i_clk), .i_en(l_en4), .i_d(i_port_write), .o_q(l_slot4_out));

    mux_4 #(4) mux1_2(.i_in0(l_slot1_out), .i_in1(l_slot2_out), .i_in2(l_slot3_out), .i_in3(l_slot4_out), 
                      .i_s(i_reg_read_0), .o_out(o_port_read_0));
                      
    mux_4 #(4) mux2_2(.i_in0(l_slot1_out), .i_in1(l_slot2_out), .i_in2(l_slot3_out), .i_in3(l_slot4_out), 
                      .i_s(i_reg_read_1), .o_out(o_port_read_1));

endmodule

/*
 * 4bits of data input (d0 - d3) and  4bits of data output (q0 - q1)
 * allows to save and load 4bit of information 
 * each 4bit information is stored in seperate slot (slots have unique adressees)
 *
 * EN (enables) -> Boolean defining if current information at data input should be saved(1) or not(0)
 * CLK -> to time saving/loading data, to time operations
 * Write_ID -> defines the adress (00, 01, 10, 11) of one of the 4 slots(register_en) ; 
 *             which get used to save the 4bits inforamtion input data 
 * Read_ID_0/1 -> defines the adress (00, 01, 10, 11) of one of the internal slots (register_en) 
               -> that should be read and set as output at Data_Read_0/1
 */