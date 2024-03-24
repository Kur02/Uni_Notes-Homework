module glitch(
   input logic x0,
   input logic x1,
   input logic x2, 
   output logic y0,
   output logic y1 
   );

   logic and1, and2;
   logic or1, or2;
   logic not1, not2, not3, not4, not5;

   assign #3 not1 = ~x0;
   assign #3 not2 = ~x2;
   assign #3 not3 = ~x0;
   assign #3 not4 = ~or1;
   assign #3 not5 = ~or2;
   assign #3 and1 = not1 & x1;
   assign #3 or1 = ~x0 & ~x1;
   assign #3 or2 = ~or1 | and1;
   assign #3 and2 = x2 & or2;
   assign #3 y0 = and2;
   assign #3 y1 = not5;

endmodule