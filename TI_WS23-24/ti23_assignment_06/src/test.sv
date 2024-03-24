module test(

   input logic x0,
   input logic x1,
   input logic x2, 
   output logic y0,
   output logic y1 
   
   );

   logic and1, and2;
   logic or1, or2;
   logic not1, not2, not3, not4, not5;

   assign not1 = ~x0;
   assign not2 = ~x2;
   assign not3 = ~x0;
   assign not4 = ~or1;
   assign not5 = ~or2;
   assign and1 = not1 & x1;
   assign or1 = ~x0 & ~x1;
   assign or2 = ~or1 | and1;
   assign and2 = x2 & or2;
   assign y0 = and2;
   assign y1 = not5;

endmodule