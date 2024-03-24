module decoder_tb;
//input 
logic [3:0] x_i;

//output
logic [6:0] x_o;

decoder dut(x_i, x_o);

initial begin
    $dumpfile("dump_decoder.vcd");
    $dumpvars;
   
    //7
    x_i = 4'b0111;
    #1;  
    assert(x_o === 7'b1111000);

    $finish;

    
end
endmodule