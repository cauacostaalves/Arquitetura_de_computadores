// ------------------------- 
// Nome: Cauã Costa Alves 
// Matricula: 855926 
// ------------------------- 

module Rec0103b (output s, 
                 input  x, 
                 input  y);
    assign s = (~(x & y)) & (~(x & ~y));
endmodule 

module test_Rec0103b; 
// ------------------------- definir dados 
    reg  x; 
    reg  y; 
    wire s;  

    Rec0103b modulo06 (s, x, y); 

// ------------------------- parte principal 
    initial 
    begin : main 
        $display("Rec0103b - Cauã Costa Alves - 855926"); 
        $display("   x    y    s"); 
        
        $monitor("%4b %4b %4b", x, y, s); 

        x = 1'b0;  y = 1'b0;
        #1      x = 1'b0;  y = 1'b1;
        #1      x = 1'b1;  y = 1'b0;
        #1      x = 1'b1;  y = 1'b1;
    end 

endmodule  
