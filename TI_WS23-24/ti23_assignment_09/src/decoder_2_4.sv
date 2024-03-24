module decoder_2_4( input  logic [1:0] i_binary,
                    output logic [3:0] o_choose );

    //desides which register should write (choosen from build in lesson (immage))
    always_comb
    case ( i_binary )
        2'b00: o_choose = 4'b0001;
        2'b01: o_choose = 4'b0010;
        2'b10: o_choose = 4'b0100;
        2'b11: o_choose = 4'b1000;
        default: o_choose = 4'b0001;
    endcase
endmodule