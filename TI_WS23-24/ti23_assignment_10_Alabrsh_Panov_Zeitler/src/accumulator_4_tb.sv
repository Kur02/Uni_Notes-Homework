/** Testbench of the 4-bit accumulator. **/
module accumulator_4_tb;

    logic       l_clk;
    logic       l_EN;
    logic [1:0] l_C;
    logic [3:0] l_D;
    logic       l_Carry;
    logic [3:0] l_Q;

    //clock
    always 
        begin
            l_clk <= 1;
            #5;
            l_clk <= 0;
            #5;
        end

    accumulator_4 m_dut( .i_CLK(l_clk), .i_EN(l_EN), .i_C(l_C), .i_D(l_D), 
                         .o_Carry(l_Carry), .o_Q(l_Q));

    initial 
    begin 
        $dumpfile("./dump/dump_accumulator_4_tb.vcd");
        $dumpvars;

        assign l_EN = 1'b1;
        assign l_C = 2'b10; 
        assign l_D = 4'b0000; //EN=1, c1=1, c0=0 --> Load (mux: D=0000 )
        #9; //clk is 0
        assert (l_Q === 4'bxxxx ); //register noch leer, deswegen kein output //läd 0000 nicht ins register, weil clk 0
        assert (l_Carry === 1'b0 );
        #1; 

        assign l_EN = 1'b1;
        assign l_C = 2'b00; 
        assign l_D = 4'b0001; //EN=1, c1=0, c0=0 --> Add (mux: Z = 0000 ) // 0000 + D=0001 in register gealden, weil clk jz 1
        #4; //#14, clk is 1
        assert (l_Q === 4'b0001 ); //0001 jz im register und wird ausgegeben 
        assert (l_Carry === 1'b0 );
        #1; 

        assign l_EN = 1'b1;
        assign l_C = 2'b00;
        assign l_D = 4'b0001; //EN=1, c1=0, c0=0 --> Add // 0001 im register + D=0001 in AddSub danach 
        #9; //#24, clk 1
        assert (l_Q === 4'b0001 ); // noch 0001 im register bevor neu ausgeben wird
        assert (l_Carry === 1'b0 );
        #1;

        assign l_EN = 1'b1;
        assign l_C = 2'b00;
        assign l_D = 4'b0101; //EN=1, c1=0, c0=0 --> Add // 0010 im register + D=0101 in AddSub danach 
        #9; //#34, clk is 1
        assert (l_Q === 4'b0101 ); // 0010 aus register ausgegeben
        assert (l_Carry === 1'b0 );
        #1;

        assign l_EN = 1'b0; 
        assign l_C = 2'b00;
        assign l_D = 4'b0100; //EN=0, c1=0, c0=0 --> Save
        #9; //#44, clk is 1
        assert (l_Q === 4'b0101 );
        assert (l_Carry === 1'b0 );
        #1;

        assign l_EN = 1'b1;
        assign l_C = 2'b00;
        assign l_D = 4'b0111; //EN=1, c1=0, c0=0 --> Add
        #9; //#55, clk is 1
        assert (l_Q === 4'b0111  );
        assert (l_Carry === 1'b0  );
        #15; //#69

        $finish;
    end
endmodule
