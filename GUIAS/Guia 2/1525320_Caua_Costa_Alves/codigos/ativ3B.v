/*
Guia_0203.v
Cauã Costa Alves - 1525320
*/

module Guia_0203;

reg [5:0] b_a = 6'b011110 ;

initial
begin : main
    $display ( "Guia_0203 - Base 4 " );
  
    $display ( "a) 0,011110(2) = 0.%x (4)", b_a[5:2] ); 
end 
endmodule 

module Guia_0203b;

reg [5:0] b_b = 6'b101001 ; 

initial
begin : main
    $display ( "Guia_0203b - Base 8 " );
  
    $display ( "b) 0,101001(2) = 0.%o%o (8)", b_b[5:3], b_b[2:0] ); 
end 
endmodule 

module Guia_0203c;

reg [7:0] b_c = 8'b10011000 ; 
initial
begin : main
    $display ( "Guia_0203c - Base 16 " );
   
    $display ( "c) 0,100110(2) = 0.%x (16)", b_c[7:4] ); 
end 
endmodule 

module Guia_0203d;
reg [7:0] b_d = 8'b11110110 ; 
initial
begin : main
    $display ( "Guia_0203d - Base 8 " );
    $display ( "d) 1,111011(2) = 1.%o%o (8)", b_d[7:4], b_d[3:0] ); 
end 
endmodule
module Guia_0203e;
reg [7:0] b_e = 8'b11011001 ;
initial
begin : main
    $display ( "Guia_0203e - Base 16 " );
    // Aproximado para 8 bits de precisão
    $display ( "e) 1101,1001(2) = %x,%x (16)", b_e[7:4], b_e[3:0] ); 
end // main
endmodule // Guia_0203e