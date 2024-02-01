module FullAdder_tb;
//input 
logic x_a, 
      x_b, 
      x_c_in;

//output
logic x_s, x_c_out;

FullAdder dut( x_a, 
               x_b, 
               x_c_in,
               x_s,
               x_c_out );

initial begin
    $dumpfile("dump_FullAdder.vcd");
    $dumpvars;

    //000
    x_a = 1'b0; 
    x_b = 1'b0; 
    x_c_in = 1'b0;
    #1;
    assert(x_s === 1'b0);
    assert(x_c_out === 1'b0);

    //001
    x_a = 1'b0; 
    x_b = 1'b0; 
    x_c_in = 1'b1;
    #1;
    assert(x_s === 1'b1);
    assert(x_c_out === 1'b0);

    //010
    x_a = 1'b0; 
    x_b = 1'b1; 
    x_c_in = 1'b0;
    #1;
    assert(x_s === 1'b1);
    assert(x_c_out === 1'b0);

    //011
    x_a               = 1'b0; 
    x_b               = 1'b1; 
    x_c_in            = 1'b1;
    #1;
    assert(x_s      === 1'b0);
    assert(x_c_out  === 1'b1);  

    //100
    x_a                = 1'b1; 
    x_b                = 1'b0; 
    x_c_in             = 1'b0;
    #1;
    assert(x_s       === 1'b1);
    assert(x_c_out   === 1'b0);

    //101
    x_a                 = 1'b1; 
    x_b                 = 1'b0; 
    x_c_in              = 1'b1;
    #1;
    assert(x_s        === 1'b0);
    assert(x_c_out    === 1'b1);

    //110
    x_a                 = 1'b1; 
    x_b                 = 1'b1; 
    x_c_in              = 1'b0;
    #1;
    assert(x_s        === 1'b0);
    assert(x_c_out    === 1'b1);

    //111
    x_a                 = 1'b1; 
    x_b                 = 1'b1; 
    x_c_in              = 1'b1;
    #1;
    assert(x_s        === 1'b1);
    assert(x_c_out    === 1'b1);

    $finish;
    end

endmodule