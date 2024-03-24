module xor3_tb;

    logic l_in0, 
          l_in1, 
          l_in2, 
          l_o;

    xor_3 dut(.i_in0(l_in0), .i_in1(l_in1), .i_in2(l_in2), .o_res(l_o));

    initial begin
        $dumpfile("dump_xor_3.vcd");
        $dumpvars;

        // 000 
        l_in0 = 1'b0;
        l_in1 = 1'b0;
        l_in2 = 1'b0;
        #10;
        assert(l_o === 1'b0);

        // 001 
        l_in0 = 1'b0;
        l_in1 = 1'b0;
        l_in2 = 1'b1;
        #10;
        assert(l_o === 1'b1);

        // 010 
        l_in0 = 1'b0;
        l_in1 = 1'b1;
        l_in2 = 1'b0;
        #10;
        assert(l_o === 1'b1);

        // 011 
        l_in0 = 1'b0;
        l_in1 = 1'b1;
        l_in2 = 1'b1;
        #10;
        assert(l_o === 1'b0);

        // 100 
        l_in0 = 1'b1;
        l_in1 = 1'b0;
        l_in2 = 1'b0;
        #10;
        assert(l_o === 1'b1);

        // 101 
        l_in0 = 1'b1;
        l_in1 = 1'b0;
        l_in2 = 1'b1;
        #10;
        assert(l_o === 1'b0);

        // 110 
        l_in0 = 1'b1;
        l_in1 = 1'b1;
        l_in2 = 1'b0;
        #10;
        assert(l_o === 1'b0);

        // 111 
        l_in0 = 1'b1;
        l_in1 = 1'b1;
        l_in2 = 1'b1;
        #10;
        assert(l_o === 1'b1);

        $finish;
        
    end
endmodule