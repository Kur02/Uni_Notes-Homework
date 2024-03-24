module sr_latch( input logic i_r,
                 input logic i_s,
                 output logic o_q,
                 output logic o_qinv );

    assign o_q = ~( i_r | o_qinv ); //NOR-Gate for Q
    assign o_qinv = ~( o_q | i_s ); //NOR-Gate for Qinv  //crossover of the outputs after the nor 

endmodule

/*
 * SR-Latch can store on bit of information
 * has 2 Inputs: S (Set) and R (Reset) --> internal state
 * output Q shows if internal state is SET to true (1) or RESET to false (0)
 * negated output Q is often left out 
*/ 