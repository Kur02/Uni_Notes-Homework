module mux21 
    (
        input logic i_x_0, 
        input logic i_x_1, 
        input logic i_s,
        output logic o_y_0 
    ); 

    assign o_y_0 = (~i_s & i_x_0) | (i_s & i_x_1);
    
endmodule