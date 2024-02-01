// Testbench für das EN D-Flip-Flop
module d_flip_flop_en_tb;
    logic l_en, l_clk, l_d, l_q;

    d_flip_flop_en m_dut(.i_en(l_en), .i_clk(l_clk), .i_d(l_d), .o_q(l_q));

    always begin
        l_clk <= 1'b1;
        #5;
        l_clk <= 1'b0;
        #5;
    end

    initial begin
        $dumpfile("dump_d_flip_flop_en_tb.vcd");
        $dumpvars;

        //D is 1 and EN is 1, and there will be a rising edge, cuz clk will be 1 --> Q is 1
        #7;
        l_en = 1'b1;
        l_d = 1'b1;
        #6;
        assert( l_q === 1'b1 );

        //#16: D is 0 and EN stil 0, after #22 clk is 1 (rising edge) --> Q is 0, cuz D is 0
        #3; 
        l_en = 1'b1;
        l_d = 1'b0;
        #7; //#22
        assert( l_q === 1'b0 );

        //#23: D is 1 and EN is 0 --> Q is 0 because EN is 0 (previous result will be set) --> #32 is clk 1 (rising edge)
        #1; 
        l_en = 1'b0;
        l_d = 1'b1;
        #9; //#32
        assert( l_q === 1'b0 );

        //37: EN is 1 --> Q is 1, because D was 1 before and #42 is clk 1 
        #5; 
        l_en = 1'b1;
        #5; // '42
        assert( l_q === 1'b1 );
        $finish;
    end

endmodule