module mux21_tb;

    logic l_x_0, 
    logic l_x_1, 
    logic l_s, 
    logic l_y_0;

    mux21 dut(l_x_0, l_x_1, l_s, l_y_0);

    initial begin
        $dumpfile("dump_mux21.vcd");
        $dumpvars;

        //Testblock 000
        l_x_0 = 1'b0;
        l_x_1 = 1'b0;
        l_s =  1'b0;
        #10;
        assert(l_y_0 === 1'b0);

        //Testblock 001
        l_x_0 = 1'b0;
        l_x_1 = 1'b0;
        l_s =  1'b1;
        #10;
        assert(l_y_0 === 1'b0);

        //Testblock 010
        l_x_0 = 1'b0;
        l_x_1 = 1'b1;
        l_s =  1'b0;
        #10;
        assert(l_y_0 === 1'b0);

        //Testblock 011
        l_x_0 = 1'b0;
        l_x_1 = 1'b1;
        l_s =  1'b1;
        #10;
        assert(l_y_0 === 1'b1);

        //Testblock 100
        l_x_0 = 1'b1;
        l_x_1 = 1'b0;
        l_s =  1'b0;
        #10;
        assert(l_y_0 === 1'b1);

        //Testblock 101
        l_x_0 = 1'b1;
        l_x_1 = 1'b0;
        l_s =  1'b1;
        #10;
        assert(l_y_0 === 1'b0);

        //Testblock 110
        l_x_0 = 1'b1;
        l_x_1 = 1'b1;
        l_s =  1'b0;
        #10;
        assert(l_y_0 === 1'b1);

        //Testblock 111
        l_x_0 = 1'b1;
        l_x_1 = 1'b1;
        l_s =  1'b1;
        #10;
        assert(l_y_0 === 1'b1);

        $finish;
    end


endmodule