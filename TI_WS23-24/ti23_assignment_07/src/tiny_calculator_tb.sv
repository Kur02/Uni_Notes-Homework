module tiny_calculator_tb;
  
    logic [7:0] SW;
    logic [6:0] HEX0,HEX1,HEX2,HEX3;

    //von rechts beginnend nach links: HEX0 zu HEX3
    //Ausgabe auf Display von FPGA: HEX3 HEX2 HEX1 HEX0
    tiny_calculator dut(.SW(SW),
                        .HEX0(HEX0), //input von den 4 switches rechts
                        .HEX1(HEX1), //input von den 4 switches links
                        .HEX2(HEX2), //output
                        .HEX3(HEX3)); //output

    initial begin
        $dumpfile("dump_tiny_calculator.vcd");
        $dumpvars;

        // 1+0 = 1 (1)
        SW = 8'b0000_0001;
        #10;
        assert( HEX3 === 7'b100_0000 );
        assert( HEX2 === 7'b111_1001 );
        assert( HEX1 === 7'b100_0000 );
        assert( HEX0 === 7'b111_1001 );
        // auf FPGA: 0 1 0 1

        // 6+2 = 8 (8)
        SW = 8'b0010_0110;
        #10;
        assert( HEX3 === 7'b100_0000 );
        assert( HEX2 === 7'b000_0000 );
        assert( HEX1 === 7'b010_0100 );
        assert( HEX0 === 7'b000_0010 );
        // auf FPGA: 0 8 2 6

        // 5+7 = 12 (C)
        SW = 8'b0111_0101;
        #10;
        assert( HEX3 === 7'b100_0000 );
        assert( HEX2 === 7'b100_0110 );
        assert( HEX1 === 7'b111_1000 );
        assert( HEX0 === 7'b001_0010 );
        // auf FPGA: 0 C 7 5 

        // 8+8 = 16 (10)
        SW = 8'b1000_1000;
        #10;
        assert( HEX3 === 7'b111_1001 );
        assert( HEX2 === 7'b100_0000 );
        assert( HEX1 === 7'b000_0000 );
        assert( HEX0 === 7'b000_0000 );
        // auf FPGA: 1 0 8 8

        // 15+15 = 30 (1E)
        SW = 8'b1111_1111;
        #10;
        assert( HEX3 === 7'b111_1001 );
        assert( HEX2 === 7'b000_0110 );
        assert( HEX1 === 7'b000_1110 );
        assert( HEX0 === 7'b000_1110 );
        // auf FPGA: 1 E F F 
    
        $finish;
    end
endmodule


    