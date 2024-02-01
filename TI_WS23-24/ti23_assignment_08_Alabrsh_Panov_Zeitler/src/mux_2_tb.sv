module mux_2_tb;
    logic [3:0] l_in0, 
                l_in1, 
                l_out;
                
    logic l_ctrl;

    mux_2 #(4) dut(.i_in0(l_in0), .i_in1(l_in1), .i_s(l_ctrl), .o_out(l_out));

    initial begin
        $dumpfile("dump_mux_2.vcd");
        $dumpvars;
        
        l_in1 = 4'b1111; //bei 1
        l_in0 = 4'b0100; //bei 0
        l_ctrl =1'b0;
        #10;
        assert(l_out === 4'b0100);

        l_in1 = 4'b1010;
        l_in0 = 4'b0100;
        l_ctrl =1'b1;
        #10;
        assert(l_out === 4'b1010);

        l_in1 = 4'b0000;
        l_in0 = 4'b1011;
        l_ctrl =1'b1;
        #10;
        assert(l_out === 4'b0000);

        l_in1 = 4'b0011;
        l_in0 = 4'b1100;
        l_ctrl =1'b1;
        #10;
        assert(l_out === 4'b0011);

        $finish;
    end
endmodule