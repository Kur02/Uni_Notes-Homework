module d_flip_flop_tb;
    logic l_d, 
          l_clk, 
          l_q,
          l_qinv;

    // Clock
    always begin
        l_clk <= 1'b1;
        #5;
        l_clk <= 1'b0;
        #5;
    end

    d_flip_flop m_dut(.i_clk(l_clk), .i_d(l_d), .o_q(l_q), .o_qinv(l_qinv));

    initial begin
        $dumpfile("dump_d_flip_flop_tb.vcd");
        $dumpvars;

        //testbench data from example waveform in lesson

        //clk is 1 and and d is 0 in de bgeinning
        #0
        l_d = 1'b0;

        //clk is already 1 and after #2 d is 1 
        //q is 0, cuz there was no rising edge
        #12;
        l_d = 1'b1;
        assert( l_q === 1'b0 );
        assert( l_qinv === 1'b1 );

        //clk is still 1 and d goes back to 0 
        // q is 0, cuz d is 0 befor rising edge 
        #1; 
        l_d = 1'b0;
        assert( l_q === 1'b0 );
        assert( l_qinv === 1'b1 );

        //#22: clk is already 1 and after #2 d is 1 
        //q is 0, cuz there was no rising edge --> rising edge was befor d got 1
        #9;
        l_d = 1'b1;
        assert( l_q === 1'b0 );
        assert( l_qinv === 1'b1 );
        
        //#27: clk is 0 and d is 0 -> q is 0, cuz no rising edge 
        #5;
        l_d = 1'b0;
        assert( l_q === 1'b0 );
        assert( l_qinv === 1'b1 );

        //#28: clk is still 0 and d is 1
        //q is 1, cuz after d gets 1, the clk will get 1 #31, an rising edge
        #1
        l_d = 1'b1;
        #3 //#31
        assert( l_q === 1'b1 );
        assert( l_qinv === 1'b0 );
        
        //#33: clk is 1 and d is 0
        // q is 1, cuz there is no rising edge after d is 0, so it doesnt change
        #2
        l_d = 1'b0;
        assert( l_q === 1'b1 );
        assert( l_qinv === 1'b0 );

        //#38: clk is still 0 and d is 1 
        // q is 1 again, cuz clk turns 1 after, an rising edge (no change, cuz it was 1 already)
        #5;
        l_d = 1'b1;
        assert( l_q === 1'b1 );
        assert( l_qinv === 1'b0 );

        //if d would be 0 in last testexaple, q would be 0, cuz of rising edge after

        $finish;
    end
endmodule