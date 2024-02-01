module sr_latch_tb;
    logic l_r, 
          l_s, 
          l_q, 
          l_qinv;

    sr_latch m_dut( .i_r(l_r), .i_s(l_s), .o_q(l_q), .o_qinv(l_qinv));

    initial begin
        $dumpfile("dump_sr_latch_tb.vcd");
        $dumpvars;

        //setting Q (saving)
        l_r = 1'b0;
        l_s = 1'b1;
        #10;
        assert(l_q === 1'b1);
        assert(l_qinv === 1'b0);

        //reading set (saved) data 
        l_r = 1'b0;
        l_s = 1'b0;
        #10;
        assert(l_q === 1'b1);
        assert(l_qinv === 1'b0);

        // resetting
        l_r = 1'b1;
        l_s = 1'b0;
        #10;
        assert(l_q === 1'b0);
        assert(l_qinv === 1'b1);
        
        //reading set data
        l_r = 1'b0;
        l_s = 1'b0;
        #10;
        assert(l_q === 1'b0);
        assert(l_qinv === 1'b1);

        $finish;
    end

endmodule