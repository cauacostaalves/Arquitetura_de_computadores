/*
Guia_0201.v
Cauã Costa Alves - 1525320
*/
module Guia_0201;
// define data
real x = 0; 
real power2 = 1.0; 
integer y = 7; 
reg [7:0] b; 


initial begin
  $display("Guia_0201 - Tests");

  
  b = 8'b00011000;
  x = 0;
  y = 7;
  power2 = 1.0;
  $display("b = 0.%8b", b);
  while (y >= 0) begin
    power2 = power2 / 2.0;
    if (b[y] == 1) begin
      x = x + power2;
    end
    y = y - 1;
  end
  $display("x = %f", x);


  b = 8'b01001000;
  x = 0;
  y = 7;
  power2 = 1.0;
  $display("b = 0.%8b", b);
  while (y >= 0) begin
    power2 = power2 / 2.0;
    if (b[y] == 1) begin
      x = x + power2;
    end
    y = y - 1;
  end
  $display("x = %f", x);


  b = 8'b10101000;
  x = 0;
  y = 7;
  power2 = 1.0;
  $display("b = 0.%8b", b);
  while (y >= 0) begin
    power2 = power2 / 2.0;
    if (b[y] == 1) begin
      x = x + power2;
    end
    y = y - 1;
  end
  $display("x = %f", x);

  // d: 1.11101000
  b = 8'b11110100;
  x = 0;
  y = 7;
  power2 = 1.0;
  $display("b = 1.%8b", b);
  while (y >= 0) begin
    power2 = power2 / 2.0;
    if (b[y] == 1) begin
      x = x + power2;
    end
    y = y - 1;
  end
  x = x + 1; 
  $display("x = %f", x);

  // e: 11.11001000
  b = 8'b11100100;
  x = 0;
  y = 7;
  power2 = 1.0;
  $display("b = 11.%8b", b);
  while (y >= 0) begin
    power2 = power2 / 2.0;
    if (b[y] == 1) begin
      x = x + power2;
    end
    y = y - 1;
  end
  x = x + 3; 
  $display("x = %f", x);
end
endmodule // Guia_0201
