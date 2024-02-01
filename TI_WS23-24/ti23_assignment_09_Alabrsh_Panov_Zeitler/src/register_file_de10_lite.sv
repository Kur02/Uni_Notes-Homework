/**
 * Top-level module of the 4-bit register file:
 *   - switches 0-1 set the register linked to read port 0.
 *   - switches 2-3 set the register linked to read port 1.
 *   - switches 4-5 set the register to which data is written.
 *   - switches 6-9 set the data at the write port.
 *   - button 0 asserts the write enable signal if pushed.
 *
 *   - HEX0 shows the id of the register linked to read port 0.
 *   - HEX1 shows the id of the register linked to read port 1.
 *   - HEX2 shows the id of the register linked to the write port.
 *   - HEX3 shows the data at the write port.
 *   - HEX4 shows the data at the first read port.
 *   - HEX5 shows the data at the second read port.
 *   - LEDR0 shows the write enable signal.
 *
 * @param MAX10_CLK1_50 clock signal available in the MAX 10 FPGA.
 * @param KEY data of the push buttons.
 * @param SW data of the switch buttons.
 * @param HEX0 output bits driving the seven-segment display HEX0.
 * @param HEX1 output bits driving the seven-segment display HEX1.
 * @param HEX2 output bits driving the seven-segment display HEX2.
 * @param HEX3 output bits driving the seven-segment display HEX3.
 * @param HEX4 output bits driving the seven-segment display HEX4.
 * @param HEX5 output bits driving the seven-segment display HEX5.
 * @param LEDR output bits driving the ten leds.
 **/
module register_file_de10_lite( input  logic       MAX10_CLK1_50,
                                input  logic [1:0] KEY,
                                input  logic [9:0] SW,
                                output logic [6:0] HEX0, HEX1,
                                                   HEX2, HEX3, 
                                                   HEX4, HEX5,              
                                output logic [9:0] LEDR );

    logic [3:0] l_reg_out1, l_reg_out2, l_reg_read0, l_reg_read1, l_reg_write;
    logic l_key;

    register_file_4 register_file_4( .i_clk(MAX10_CLK1_50),
                                     .i_reg_read_0(SW[1:0]), // choosing register to read for output o_port_read_0
                                     .i_reg_read_1(SW[3:2]), // choosing register to read for output o_port_read_1
                                     .i_reg_write(SW[5:4]),  // desiding in which register data should be written 
                                     .i_port_write(SW[9:6]), // writing input data
                                     .i_write_enable(l_key), //EN
                                     .o_port_read_0(l_reg_out1), 
                                     .o_port_read_1(l_reg_out2)); //shows saved data from choosen register as output
  
    //we need the decoder with 4bit input for the HEX displays 
    //so we assign 4 bit to the 2bit switches: 4'b00xx //xx = 00, 01, 10, 11
    assign l_reg_read0 = 4'b0000 + SW[1:0]; 
    assign l_reg_read1 = 4'b0000 + SW[3:2]; 
    assign l_reg_write = 4'b0000 + SW[5:4]; 

    assign l_key = ~KEY[0]; //cuz of FPGA KEY need to be negated 
    assign LEDR[0] = l_key; // EN-Signal

    //reads saved data in choosen register -> shows choosen id of register on HEX0
    decoder dec_reg_read_0(.i_binary_number(l_reg_read0), .o_display(HEX0)); 

    //reads saved data in choosen register -> shows choosen id of register on HEX1
    decoder dec_reg_read_1(.i_binary_number(l_reg_read1), .o_display(HEX1));

    //desides in which register data should be written (00, 01, 10, 11) -> shows on HEX2
    decoder dec_reg_write(.i_binary_number(l_reg_write), .o_display(HEX2));

    //Writing input data (4bit) --> written data showing on HEX3
    decoder dec_port_write(.i_binary_number(SW[9:6]), .o_display(HEX3));

    //showing saved data from choosen register on HEX4
    decoder dec_read_port_0(.i_binary_number(l_reg_out1), .o_display(HEX4));

    //showing saved data from choosen register on HEX5
    decoder dec_read_port_1(.i_binary_number(l_reg_out2), .o_display(HEX5));
    
endmodule