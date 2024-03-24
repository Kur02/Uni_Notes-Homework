module adder_tb;
    logic [15:0] l_a, 
                 l_b,
                 l_s;

    logic l_carry_in, 
          l_carry_out;

    adder #(16) dut(l_a, l_b, l_carry_in, l_s, l_carry_out);
    
    initial begin
        $dumpfile("dump_adder.vcd");
        $dumpvars;

        l_a = 16'b0000_0000_0000_0000;
        l_b = 16'b0000_0000_0000_0000;
        l_carry_in =1'b0;
        #10;
        assert(l_carry_out === 1'b0);
        assert(l_s=== 16'b0000_0000_0000_0000);
 
        l_a = 16'b1111_1111_1111_1111;
        l_b = 16'b1111_1111_1111_1111;
        l_carry_in =1'b0;
        #10;
        assert(l_carry_out === 1'b1);
        assert(l_s === 16'b1111_1111_1111_1110);
        
        l_a = 16'b1100_0000_0000_0000;
        l_b = 16'b0111_0000_0000_0000;
        l_carry_in =1'b0;
        #10;
        assert(l_carry_out === 1'b1);
        assert(l_s === 16'b0011_0000_0000_0000);

        l_a = 16'b1110_0000_0000_0000;
        l_b = 16'b1110_0000_0000_0000;
        l_carry_in =1'b1;
        #10;
        assert(l_carry_out === 1'b1);
        assert(l_s=== 16'b1100_0000_0000_0001);
        
        $finish;
    end
endmodule