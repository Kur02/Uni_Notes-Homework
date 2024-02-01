module mux_4_tb;
    logic [3:0] l_in0, 
                l_in1, 
                l_in2, 
                l_in3, 
                l_out;
    logic [1:0] l_ctrl;

    mux_4 #(4) dut(.i_in0(l_in0), .i_in1(l_in1), .i_in2(l_in2), .i_in3(l_in3), .i_s(l_ctrl), .o_out(l_out));

    initial begin
        $dumpfile("dump_mux_4.vcd");
        $dumpvars;

        l_in0 = 4'b1111; //bei 00
        l_in1 = 4'b0000; //bei 01
        l_in2 = 4'b0011; //bei 10
        l_in3 = 4'b0101; //bei 11
        l_ctrl =2'b00;
        #10;
        assert(l_out === 4'b1111);

        l_in0 = 4'b1111; //bei 00
        l_in1 = 4'b0000; //bei 01
        l_in2 = 4'b0011; //bei 10
        l_in3 = 4'b0101; //bei 11
        l_ctrl =2'b01;
        #10;
        assert(l_out === 4'b0000);

        l_in0 = 4'b1111; //bei 00
        l_in1 = 4'b0000; //bei 01
        l_in2 = 4'b0011; //bei 10
        l_in3 = 4'b0101; //bei 11
        l_ctrl =2'b10;
        #10;
        assert(l_out === 4'b0011);

        l_in0 = 4'b1111; //bei 00
        l_in1 = 4'b0000; //bei 01
        l_in2 = 4'b0011; //bei 10
        l_in3 = 4'b0101; //bei 11
        l_ctrl =2'b11;
        #10;
        assert(l_out === 4'b0101);

        $finish;
    end
endmodule