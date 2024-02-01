module decoder_2_4_tb;
    logic [1:0] l_in;
    logic [3:0] l_out;

    decoder_2_4 m_dut(.i_binary(l_in), .o_choose(l_out));

    initial begin
        $dumpfile("dump_decoder_2_4.vcd");
        $dumpvars;

        //0. Register 
        l_in = 2'b00;
        #5;
        assert( l_out === 4'b0001 );

        //1. Register 
        l_in = 2'b01;
        #5;
        assert( l_out === 4'b0010 );

        //2. Register 
        l_in = 2'b10;
        #5;
        assert( l_out === 4'b0100 );

        //3. Register 
        l_in = 2'b11;
        #5;
        assert( l_out === 4'b1000 );
        
        $finish;
    end
endmodule