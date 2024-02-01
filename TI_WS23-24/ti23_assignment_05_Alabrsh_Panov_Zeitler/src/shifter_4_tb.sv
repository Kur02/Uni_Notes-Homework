/**
 * Testbench of a 4-bit shifter.
 */
module shifter_4_tb; 
    logic [3:0] l_a, l_s;
    logic d_in;
    shifter_4 m_dut( .i_a(l_a),
                     .i_d(d_in),
                     .o_s(l_s)  );
    initial begin
    $dumpfile("dump_shifter_4.vcd");
    $dumpvars;

    //Testblock 1:
    l_a = 4'b0000;
    d_in = 1'b0;
    #10;
    assert( l_s === 4'b0000);

    //Testblock 2:
    l_a = 4'b0000;
    d_in = 1'b1;
    #10;
    assert( l_s === 4'b0000);

    //Testblock 3:
    l_a = 4'b1111;
    d_in = 1'b0;
    #10;
    assert( l_s === 4'b0111);

    //Testblock 4:
    l_a = 4'b1111;
    d_in = 1'b1;
    #10;
    assert( l_s === 4'b1110);

    //Testblock 5:
    l_a = 4'b1011;
    d_in = 1'b0;
    #10;
    assert( l_s === 4'b0101);

    //Testblock 6:
    l_a = 4'b1101;
    d_in = 1'b1;
    #10;
    assert( l_s === 4'b1010);

    //Testblock 7:
    l_a = 4'b100X;
    d_in = 1'b0;
    #10;
    assert( l_s === 4'b0100);

    //Testblock 8:
    l_a = 4'bX010;
    d_in = 1'b1;
    #10;
    assert( l_s === 4'b0100);

    $finish;

end
    

endmodule