module register_file_de10_lite_tb;

    logic MAX10_CLK1_50;
    logic [1:0] KEY;
    logic [9:0] SW, LEDR;
    logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

    // clock
    always
    begin
        MAX10_CLK1_50 <= 1;
        #5;
        MAX10_CLK1_50 <= 0;
        #5;
    end

    register_file_de10_lite m_dut(.MAX10_CLK1_50(MAX10_CLK1_50),
                                  .KEY(KEY),
                                  .LEDR(LEDR),
                                  .SW(SW), 
                                  .HEX0(HEX0), 
                                  .HEX1(HEX1),
                                  .HEX2(HEX2),
                                  .HEX3(HEX3),
                                  .HEX4(HEX4),
                                  .HEX5(HEX5)); 
    
    initial begin
        $dumpfile("dump_register_file_de10_lite_tb.vcd");
        $dumpvars;

        #19
        SW [1:0] = 2'b01; // choosing register id to read for output o_port_read_0
        SW [3:2] = 2'b01; // choosing register id to read for output o_port_read_1
        SW [5:4] = 2'b01; // desiding in which register data should be written (00,01,10,11)
        SW [9:6] = 4'b0110; //input data
        KEY [0] = 1'b0; // en is 1, cuz inverted 0
        #19;
        assert(HEX0 === 7'b111_1001); 
        assert(HEX1 === 7'b111_1001); 
        assert(HEX2 === 7'b111_1001); 
        assert(HEX3 === 7'b000_0010); //shows written input data
        assert(HEX4 === 7'b000_0010); //shows saved data from choosen register 01
        assert(HEX5 === 7'b000_0010); //shows saved data from choosen register 01
        assert(LEDR[0] === 1'b1);
        
        $finish;
    end 
endmodule
