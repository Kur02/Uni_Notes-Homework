module AdderRC_4_tb;
    //input 
    logic [3:0] xa;
    logic [3:0] xb;

    //output
    logic [4:0] xs;

    AdderRC_4 dut(xa, xb, xs);

    initial begin
            $dumpfile("dump_AdderRC_4.vcd");
            $dumpvars;

            //1: 0000+0000=00000
            xa =           4'b0000;
            xb =           4'b0000;
            #1;
            assert(xs === 5'b00000);

            //2: 0111+0001=01000
            xa =           4'b0111;
            xb =           4'b0001;
            #1;
            assert(xs === 5'b01000);

            //3: 1111+1101=11100
            xa =           4'b1111;
            xb =           4'b1101;
            #1;
            assert(xs === 5'b11100);

            //4: 1011+0011=01110
            xa =           4'b1011;
            xb =           4'b0011;
            #1;
            assert(xs === 5'b01110);

            //5: 1101+0011=10000
            xa =           4'b1101;
            xb =           4'b0011;
            #1;
            assert(xs === 5'b10000);

            //6: 1011+1001=10100
            xa =           4'b1011;
            xb =           4'b1001;
            #1;
            assert(xs === 5'b10100);

            $finish;
        end
endmodule