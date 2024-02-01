module mux_8_4_tb;

    logic [3:0] l_a, l_b, l_out;
    logic       l_ctrl;
            
    mux_8_4 m_dut(.i_a(l_a), .i_b(l_b), .i_s(l_ctrl), .o_out(l_out));

    initial begin
        $dumpfile("./dump/dump_mux_8_4_tb.vcd");
        $dumpvars;

        l_a = 4'b0000;
        l_b = 4'b1111;
        l_ctrl =1'b1;
        #10;
        assert(l_out === 4'b0000);

        l_a = 4'b0001;
        l_b = 4'b0011;
        l_ctrl =1'b0;
        #10;
        assert(l_out === 4'b0011);
    
        l_a = 4'b1100;
        l_b = 4'b0011;
        l_ctrl =1'b1;
        #10;
        assert(l_out === 4'b1100);

        $finish;
    end
endmodule