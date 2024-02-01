module accumulator_basic_de10_lite_tb;

    logic MAX10_CLK2_50;
    logic [1:0] KEY;
    logic [9:0] SW, LEDR;
    logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
    reg  [32:0] cont;
    logic l_clk;

    // clock
    always
    begin
        l_clk <= 1;
        #1;
        l_clk <= 0;
        #1;
    end

    accumulator_basic_de10_lite m_dut (.MAX10_CLK2_50(l_clk),
                                        .KEY(KEY),
                                        .SW(SW),
                                        .HEX0(HEX0), 
                                        .HEX1(HEX1),
                                        .LEDR(LEDR));

    initial begin 
        $dumpfile("./dump/dump_accumulator_basic_4_de10_lite_tb.vcd");
        $dumpvars;

        SW[3:0] = 4'b0010; //input D = 2
        SW[4] = 1'b0; //c0 // Add or Sub
        SW[5] = 1'b1; //EN //diesmal nich invertiert weil nicht auf key button
        #1000000//clk is 1
        KEY[0] = 1'b1; //c1 -> D
        assert(HEX0 === 7'b010_0100); //shows input D = 2
        assert(HEX1 === 7'bxxx_xxxx); //shows Output Q = 0
        $display(HEX1);

        #68000000 //clk is 1
        KEY[0] = 1'b0; //c1 -> z
        assert(HEX0 === 7'b010_0100); //shows input D
        assert(HEX1 === 7'b010_0100 ); //shows Output Q = 2
        $display(HEX1);

        #68000000
        assert(HEX0 === 7'b010_0100); //shows input D
        assert(HEX1 === 7'b001_1001); //shows Output Q = 4
        $display(HEX1);

        $finish;
    end
endmodule