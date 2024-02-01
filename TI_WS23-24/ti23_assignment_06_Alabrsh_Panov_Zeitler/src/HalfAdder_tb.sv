module generic_tb;
//input 
logic l_a, l_b;

//output
logic l_s, l_c;

HalfAdder dut(l_a, l_b, l_s, l_c);

initial begin

    $dumpfile("dump_HalfAdder.vcd");

    $dumpvars;

    //00
    l_a = 1'b0;
    l_b = 1'b0;
    #1;
    assert(l_s === 1'b0);
    assert(l_c === 1'b0);

    //01
    l_a = 1'b0;
    l_b = 1'b1;
    #1;
    assert(l_s === 1'b1);
    assert(l_c === 1'b0);

    //10
    l_a = 1'b1;
    l_b = 1'b0;
    #1;
    assert(l_s === 1'b1);
    assert(l_c === 1'b0);

    //11
    l_a = 1'b1;
    l_b = 1'b1;
    #1;
    assert(l_s === 1'b0);
    assert(l_c === 1'b1);

    $finish;
    end
    
endmodule