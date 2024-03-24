module register_en_4_tb;
    logic l_clk, 
          l_en;
    logic [3:0] l_d, 
                l_q;

    always begin
        l_clk <= 1'b1;
        #5;
        l_clk <= 1'b0;
        #5;
    end

    register_en_4 m_dut(.i_clk(l_clk), .i_en(l_en), .i_d(l_d), .o_q(l_q));
                              
    initial begin
        $dumpfile("./dump/dump_register_en_4_tb.vcd");
        $dumpvars;

        // clk is 0 and d is 0000 and en is 1 --> #14: clk is 1 and at rising edge(#10) q will be 0000
        #7;
        l_en = 1'b1;
        l_d = 4'b0000;
        #7; //#14
        assert( l_q === 4'b0000 );

        //#16: clk is 0, d is 0110 and en is 1 --> at next rising edge (#20): q will be 0110
        #2; 
        l_en = 1'b1;
        l_d = 4'b0110;
        #7; //#22
        assert( l_q === 4'b0110 );

        //#23: clk is 1, d is 1111 and en is 0 --> no changes, cuz en is 0, doesnt matter what d and clk is
        #1; 
        l_en = 1'b0;
        l_d = 4'b1111;
        #9; //#32
        assert( l_q === 4'b0110 );

        //#37: clk is 0 and en is 1 --> at next rising edge (#40), q will be 1111
        #5; 
        l_en = 1'b1;
        #5; //#42
        assert( l_q === 4'b1111 );

        $finish;
    end
endmodule