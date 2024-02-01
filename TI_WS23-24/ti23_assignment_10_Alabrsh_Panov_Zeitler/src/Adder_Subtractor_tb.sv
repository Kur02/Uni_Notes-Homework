module Adder_Substractor_tb;

    logic [3:0] l_a, l_b, l_result;
    logic l_ctrl, l_carry_out;

    Adder_Subtractor m_dut (.i_a(l_a), .i_b(l_b), .i_ctrl(l_ctrl), .o_result(l_result), .o_carry_out(l_carry_out));

    initial begin
        $dumpfile("./dump/dump_Adder_Substractor_tb.vcd");
        $dumpvars;

        //if ctrl is 0, then addition, else substraction

        l_a = 4'b1010;
        l_b = 4'b0101;
        l_ctrl = 1;
        #10
        assert(l_result === 4'b0101);
        assert(l_carry_out === 1);


        l_a = 4'b1010;
        l_b = 4'b0101;
        l_ctrl = 0;
        #10
        assert(l_result === 4'b1111);
        assert(l_carry_out === 0);


        l_a = 4'b1111;
        l_b = 4'b1111;
        l_ctrl = 1;
        #10
        assert(l_result === 4'b0000);
        assert(l_carry_out === 1);


        l_a = 4'b0001;
        l_b = 4'b0011;
        l_ctrl = 1;
        #10
        assert(l_result === 4'b1110); //1-3 = -2 // -2+1 -> -1 -> 1 -> 0001 -> 1110
        assert(l_carry_out === 0);


        l_a = 4'b0000;
        l_b = 4'b1111;
        l_ctrl = 1;
        #10
        assert(l_result === 4'b0001);//-15 
        assert(l_carry_out === 0);
    
        
        l_a = 4'b1111;
        l_b = 4'b1111;
        l_ctrl = 0;
        #10
        assert(l_result === 4'b1110);
        assert(l_carry_out === 1);


        l_a = 4'b1101;
        l_b = 4'b1100;
        l_ctrl = 0;
        #10
        assert(l_result === 4'b1001);
        assert(l_carry_out === 1);
        
        $finish;
    end    
endmodule