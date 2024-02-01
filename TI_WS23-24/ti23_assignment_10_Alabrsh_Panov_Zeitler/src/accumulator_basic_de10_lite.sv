/**
 * Top-level module of the 4-bit basic accumulator:
 * - switches 3-0 set the input values (D3, D2, D1, D0).
 * - switch 4 sets the control c0.
 * - switch 5 sets the EN variable to enable the accumulator.
 * - button 0 sets the control c1.
 * - HEX0 shows the hex-number of the 4-bit input (D3, D2, D1, D0).
 * - HEX1 shows the hex-number of the 4-bit output (Q3, Q2, Q1, Q0).
 * - LEDR 0-5 shows the values of the switches 0-5
 * - LEDR 9 shows the value of the push button 0 ("on" if pressed)
 * @param KEY data of the push buttons.
 * @param SW data auf the switch buttons.
 * @param HEX0 output bits driving the seven-segment display HEX0.
 * @param HEX1 output bits driving the seven-segment display HEX1.
 * @param LEDR output bits driving the the ten leds
**/

module accumulator_basic_de10_lite( input  logic       MAX10_CLK2_50,
                                    input  logic [1:0] KEY,
                                    input  logic [9:0] SW,
                                    output logic [6:0] HEX0,
                                    output logic [6:0] HEX1,                           
                                    output logic [9:0] LEDR );

    logic       l_clk;
    logic       l_EN;
    logic [1:0] l_C;
    logic [3:0] l_D;
    logic       l_Carry;
    logic [3:0] l_Q;
    reg  [32:0] cont;
    logic l_key;

    initial
    begin
        cont <= 0;
        l_clk <= 0;
    end

    always @(posedge MAX10_CLK2_50)
    begin
        cont <= cont + 1;
            l_clk <= (cont[24] == 1'b0)? 1'b1 : 1'b0;
    end

    accumulator_4 accumulator_4(.i_CLK(l_clk), 
                                .i_EN(l_EN), 
                                .i_C(l_C),
                                .i_D(l_D), 
                                .o_Carry(l_Carry),
                                .o_Q(l_Q));

    assign l_D = SW[3:0]; //input D0-D3
    assign LEDR[3:0] = l_D;

    assign l_EN = SW[5]; //EN
    assign LEDR[5] = l_EN;

    assign l_C[1] = ~KEY[0]; //c1
    assign l_C[0] = SW[4]; //c0 

    assign LEDR[4] = SW[4];

    assign LEDR[9] = ~KEY[0]; //control c1 -> cuz of FPGA KEY need to be negated 

    decoder dec_input_D(.i_binary_number(l_D), .o_display(HEX0)); //shows the hex-number of the 4-bit input (D3, D2, D1, D0)

    decoder dec_output_Q(.i_binary_number(l_Q), .o_display(HEX1)); //shows the hex-number of the 4-bit output (Q3, Q2, Q1, Q0)

    assign LEDR[7] = l_Carry; 
    //in der Aufgabenbeschreibung wurde nicht erwähnt wie das Carry auf den FPGAs dargestellt wird
    //Deshalb assign ich es auf LEDR7, wenn es leuchtet, dann ist Carry 1

endmodule