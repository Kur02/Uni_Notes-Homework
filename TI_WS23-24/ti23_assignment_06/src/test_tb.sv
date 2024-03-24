module test_tb;
//input 
logic x0;
logic x1;
logic x2;

//output
logic y0;
logic y1;

test dut(x0, x1, x2, y0, y1);

initial begin
    $dumpfile("dump_test.vcd");
    $dumpvars;
   
    //000
    x2 = 1'b0;
    x1 = 1'b0;
    x0 = 1'b0;
    #20;

    //001
    x2 = 1'b0;
    x1 = 1'b0;
    x0 = 1'b1;
    #20;


    //010
    x2 = 1'b0;
    x1 = 1'b1;
    x0 = 1'b0;
    #20;


    //011
    x2 = 1'b0;
    x1 = 1'b1;
    x0 = 1'b1;
    #20;

    //100
    x2 = 1'b1;
    x1 = 1'b0;
    x0 = 1'b0;
    #20;


    //101
    x2 = 1'b1;
    x1 = 1'b0;
    x0 = 1'b1;
    #20;


    //110
    x2 = 1'b1;
    x1 = 1'b1;
    x0 = 1'b0;
    #20;

    //111
    x2 = 1'b1;
    x1 = 1'b1;
    x0 = 1'b1;
    #20;

    $finish;

    
end
endmodule
