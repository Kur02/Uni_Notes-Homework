/**
* Top level entry of the tiy calculater.
* Add the 4 bit binary numer in SW[7:4] ans SW[3:0].
* The two inputs are shown on the display HEX1 und HEX0.
* The result of teh addition is shown on displays HEX3 and HEX2.
* @param SW bits of the switches SW7, SW6, SW5, ..., SW1 and SW0.
* @param HEX0 output bits driving seven segment display HEX0.
* @param HEX1 output bits driving seven segment display HEX1.
* @param HEX2 output bits driving seven segment display HEX2.
* @param HEX3 output bits driving seven segment display HEX3.
**/

module  tiny_calculator(input  logic [7:0] SW,
                        output logic [6:0] HEX0,
                        output logic [6:0] HEX1,
                        output logic [6:0] HEX2,
                        output logic [6:0] HEX3 );
                        
    // logic signals send from 4B RC Adder to HEX2 and HEX3 Outputs
    logic [4:0] l_sum;
    
    //input of decoder is 4 bits
    decoder decoder_Hex0(.i_binary_number(SW[3:0]), .o_display(HEX0)); //Output A //Input of right 4 Switches 
    
    decoder decoder_Hex1(.i_binary_number(SW[7:4]), .o_display(HEX1)); //Output B //input of left 4 Switches
    
    AdderRC_4 ripple_adder( .i_a(SW[3:0]),  //Calculating the result 
                            .i_b(SW[7:4]),
                            .o_s(l_sum));  // ouput is 5 bits
    
    decoder decoder_Hex2(.i_binary_number(l_sum[3:0]), .o_display(HEX2)); //Output result 
    
    decoder decoder_Hex3(.i_binary_number({3'b000, l_sum[4]}), .o_display(HEX3)); //Output CarryOut with CarryBits
endmodule