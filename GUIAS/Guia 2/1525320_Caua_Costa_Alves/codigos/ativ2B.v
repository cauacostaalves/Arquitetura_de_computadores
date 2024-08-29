/*
  Guia_0202.v
 Cauã Costa Alves - 1525320
*/
module Guia_0202;
// define data
real x = 0.75; 
integer y = 7; 
reg [7:0] b = 0; 


initial begin : main
  $display("Guia_0202 - Tests");


  x = 0.375;
  y = 7;
  b = 8'b00000000;
  $display("Decimal: %f", x);
  while (x > 0 && y >= 0) begin
    if (x * 2 >= 1) begin
      b[y] = 1;
      x = x * 2.0 - 1.0;
    end else begin
      b[y] = 0;
      x = x * 2.0;
    end
    y = y - 1;
  end
  $display("Binary: 0.%8b", b);

  
  x = 0.125;
  y = 7;
  b = 8'b00000000;
  $display("Decimal: 2 + %f", x);
  while (x > 0 && y >= 0) begin
    if (x * 2 >= 1) begin
      b[y] = 1;
      x = x * 2.0 - 1.0;
    end else begin
      b[y] = 0;
      x = x * 2.0;
    end
    y = y - 1;
  end
  $display("Binary: 10.%8b", b);

  
  x = 0.625;
  y = 7;
  b = 8'b00000000;
  $display("Decimal: 3 + %f", x);
  while (x > 0 && y >= 0) begin
    if (x * 2 >= 1) begin
      b[y] = 1;
      x = x * 2.0 - 1.0;
    end else begin
      b[y] = 0;
      x = x * 2.0;
    end
    y = y - 1;
  end
  $display("Binary: 11.%8b", b);


  x = 0.03125;
  y = 7;
  b = 8'b00000000;
  $display("Decimal: 5 + %f", x);
  while (x > 0 && y >= 0) begin
    if (x * 2 >= 1) begin
      b[y] = 1;
      x = x * 2.0 - 1.0;
    end else begin
      b[y] = 0;
      x = x * 2.0;
    end
    y = y - 1;
  end
  $display("Binary: 101.%8b", b);

 
  x = 0.75;
  y = 7;
  b = 8'b00000000;
  $display("Decimal: 6 + %f", x);
  while (x > 0 && y >= 0) begin
    if (x * 2 >= 1) begin
      b[y] = 1;
      x = x * 2.0 - 1.0;
    end else begin
      b[y] = 0;
      x = x * 2.0;
    end
    y = y - 1;
  end
  $display("Binary: 110.%8b", b);

end // main
endmodule // Guia_0202
