module alu_de10_lite_tb;

    logic [9:0] SW, LEDR;
    logic [6:0] HEX0, HEX1, HEX2;

    alu_de10_lite dut(.SW(SW), 
                      .LEDR(LEDR), //LED blinking -> carry_out
                      .HEX0(HEX0), //input a
                      .HEX1(HEX1), //input b
                      .HEX2(HEX2)); //result

    initial begin
        $dumpfile("dump_alu_de10_lite.vcd");
        $dumpvars;

        //i_a und i_b sind inputs in alu und ctrl entscheidet ob ADD(00), SUB(01), AND(10), OR(11)

        SW [3:0] = 4'b0011; //i_a
        SW [7:4] = 4'b0010; //i_b
        SW [9:8] = 2'b00; //i_alu_ctrl //ADD
        #10;
        assert(HEX0 === 7'b011_0000); //input a showing in HEX //3
        assert(HEX1 === 7'b010_0100); //input b showing //2
        assert(HEX2 === 7'b001_0010); //o_result //4'b0101 //5
        assert(LEDR[7] === 1'b0 ); //o_carry_out 
        assert(LEDR[1:0] === 2'b00);

        //andere Möglichkeit: SW = 10'b01_1010_1011
        //andere Möglichkeit: LEDR = 10'b00_1000_0000

        SW [3:0] = 4'b1011; 
        SW [7:4] = 4'b1010; 
        SW [9:8] = 2'b01; //SUB
        #10;
        assert(HEX0 === 7'b000_0011); //11 -> b
        assert(HEX1 === 7'b000_1000); //10 -> A
        assert(HEX2 === 7'b111_1001); //4'b0001 //1
        assert(LEDR [7] === 1'b1); 
        assert(LEDR[1:0] === 2'b01);
        

        SW [3:0] = 4'b1001; 
        SW [7:4] = 4'b1110; 
        SW [9:8] = 2'b10; //AND
        #10;
        assert(HEX0 === 7'b001_0000); //9
        assert(HEX1 === 7'b000_0110); //14 -> E
        assert(HEX2 === 7'b000_0000); //4'b1000 //8
        assert(LEDR[7] === 1'b1); 
        assert(LEDR[1:0] === 2'b10);


        SW [3:0] = 4'b1001; 
        SW [7:4] = 4'b1110; 
        SW [9:8] = 2'b11; //OR
        #10;
        assert(HEX0 === 7'b001_0000); //9
        assert(HEX1 === 7'b000_0110); //14 -> E
        assert(HEX2 === 7'b000_1110); //4'b1111 //F
        assert(LEDR[7] === 1'b0); 
        assert(LEDR[1:0] === 2'b11);

        $finish;
    end 
endmodule