module d_latch_tb;
    logic l_d, 
          l_clk, 
          l_q, 
          l_qinv;

    d_latch m_dut(.i_d(l_d), .i_clk(l_clk), .o_q(l_q), .o_qinv(l_qinv));

    // Clock
    always begin
        l_clk <= 1'b1;
        #5;
        l_clk <= 1'b0;
        #5;
    end

    initial begin
        $dumpfile("dump_d_latch_tb.vcd");
        $dumpvars;

        //CLK is 0 --> nothing gets set doesnt matter what D is 
        l_d = 1'b0;
        #6;
        assert( l_q === 1'b0 );
        assert( l_qinv === 1'b1 );

        //CLK is 1 and D is 1 --> SET
        l_d = 1'b1;
        #6; //#12
        assert( l_q === 1'b1 );
        assert( l_qinv === 1'b0 );
        
        //CLK is 0 and D is 0 --> no changes, previous output
        #5; //#17
        l_d = 1'b0;
        assert( l_q === 1'b1 );
        assert( l_qinv === 1'b0 );
        
        //CLK is 1 and now D gets read and is 0 --> RESET (0,1)
        #7; //#23
        assert( l_q === 1'b0 );
        assert( l_qinv === 1'b1 );

        //CLK is 1 and D is 1 --> SET (1,0) --> as Result Q
        l_d = 1'b1;
        #11 //#33
        assert( l_q === 1'b1 );
        assert( l_qinv === 1'b0 );

        $finish;
    end
endmodule